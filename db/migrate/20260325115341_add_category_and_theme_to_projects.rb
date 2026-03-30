class AddCategoryAndThemeToProjects < ActiveRecord::Migration[8.1]
  def change
    add_reference :projects, :category, foreign_key: true
    add_reference :projects, :theme, foreign_key: true
  end
end
