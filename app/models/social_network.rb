class SocialNetwork < ApplicationRecord
  belongs_to :profile

  enum social_network_type: { linkedin: 1, github: 2 }
end
