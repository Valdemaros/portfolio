class RemoveCategoryAndThemeFromProjects < ActiveRecord::Migration[8.1]
  def change
    remove_column :projects, :category_id if column_exists?(:projects, :category_id)
    remove_column :projects, :theme_id if column_exists?(:projects, :theme_id)
  end
end
