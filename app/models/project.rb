class Project < ApplicationRecord
  has_many :project_technologies
  has_many :technologies, through: :project_technologies

  validates :title, presence: true
end  
