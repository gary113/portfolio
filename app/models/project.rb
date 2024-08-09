class Project < ApplicationRecord
  has_one_attached(:project_image)
  belongs_to(:profile)
  has_many(:project_technologies, dependent: :destroy)
  has_many(:technologies, through: :project_technologies)

  enum(project_status: { disabled: 0, enabled: 1 })

  default_scope { order(project_position: :asc) }

  def project_status_humanized
    I18n.t("activerecord.attributes.project.project_statuses.#{project_status}")
  end
end
