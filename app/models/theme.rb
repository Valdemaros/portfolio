class Theme < ApplicationRecord
  has_many :project_themes, dependent: :destroy
  has_many :projects, through: :project_themes
end
