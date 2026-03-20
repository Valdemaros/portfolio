class CreateProjects < ActiveRecord::Migration[8.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.string :project_url
      t.string :github_url
      t.string :position
      t.boolean :featured

      t.timestamps
    end
  end
end
