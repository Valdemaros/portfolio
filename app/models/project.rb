class Project < ApplicationRecord
  has_many :project_categories, dependent: :destroy
  has_many :project_themes, dependent: :destroy
  has_many :categories, through: :project_categories
  has_many :themes, through: :project_themes

  has_many :project_technologies
  has_many :technologies, through: :project_technologies
  has_many :project_features
  has_many :features, through: :project_features
  has_one_attached :image

  validates :title, presence: true
end  
