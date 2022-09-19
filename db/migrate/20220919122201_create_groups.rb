class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      name = t.string :name
      icon = t.string :icon

      t.timestamps
    end
  end
end
