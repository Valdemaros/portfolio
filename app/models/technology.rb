class Technology < ApplicationRecord
  has_many :project_technologies
  has_many :projects, through: :project_technologies

  validates :name, presence: true, uniqueness: true
end
