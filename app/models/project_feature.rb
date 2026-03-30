class ProjectFeature < ApplicationRecord
  belongs_to :project
  belongs_to :feature
end
