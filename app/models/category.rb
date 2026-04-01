class Category < ApplicationRecord
  has_many :project_categories, dependent: :destroy
  has_many :projects, through: :project_categories
end
