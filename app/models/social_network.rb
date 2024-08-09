class SocialNetwork < ApplicationRecord
  belongs_to :profile
  has_one_attached :social_network_icon

  default_scope { order(social_network_position: :asc) }

  enum social_network_status: { disabled: 0, enabled: 1 }

  def social_network_status_humanized
    I18n.t("activerecord.attributes.social_network.social_network_statuses.#{social_network_status}")
  end
end
