class Profile < ApplicationRecord
  has_one_attached(:profile_picture)
  has_rich_text(:profile_about_text)

  has_many(:social_networks, dependent: :destroy)
  has_many(:projects, dependent: :destroy)
  has_many(:messages, dependent: :destroy)

  enum(profile_status: { inactive: 0, active: 1 })

  def self.current_profile
    Profile.find_by(profile_status: :active)
  end

  def profile_status_humanized
    I18n.t("activerecord.attributes.profile.profile_statuses.#{profile_status}")
  end
end
