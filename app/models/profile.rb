class Profile < ApplicationRecord
  has_one_attached :profile_picture
  has_many :social_networks, dependent: :destroy
  has_many :projects, dependent: :destroy

  enum profile_status: { inactive: 0, active: 1 }

  def self.current_profile
    Profile.find_by(profile_status: :active)
  end
end
