class Project < ApplicationRecord
  has_one_attached :project_image
  belongs_to :profile

  enum project_status: { disabled: 0, enabled: 1 }
end
