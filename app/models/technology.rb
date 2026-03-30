class Technology < ApplicationRecord
  has_many :project_technologies
  has_many :projects, through: :project_technologies
  has_one_attached :icon

  validates :name, presence: true, uniqueness: true
end
