class Project < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :theme, optional: true
  has_many :project_technologies
  has_many :technologies, through: :project_technologies
  has_many :project_features
  has_many :features, through: :project_features
  has_one_attached :image

  validates :title, presence: true
end  
