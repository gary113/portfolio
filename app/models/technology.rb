class Technology < ApplicationRecord
  has_one_attached(:technology_icon)
  has_many(:project_technologies, dependent: :destroy)
  has_many(:projects, through: :project_technologies)

  default_scope { order(technology_position: :asc) }
end
