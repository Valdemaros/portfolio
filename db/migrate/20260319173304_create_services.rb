class CreateServices < ActiveRecord::Migration[8.1]
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.string :icon_url
      t.integer :position

      t.timestamps
    end
  end
end
