class CreateProjectThemes < ActiveRecord::Migration[8.1]
  def change
    create_table :project_themes do |t|
      t.references :project, null: false, foreign_key: true
      t.references :theme, null: false, foreign_key: true
      t.timestamps
    end
    add_index :project_themes, [:project_id, :theme_id], unique: true
  end
end
