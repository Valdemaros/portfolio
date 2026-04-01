class CreateProjectCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :project_categories do |t|
      t.references :project, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
    add_index :project_themes, [:project_id, :theme_id], unique: true
  end
end
