class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      name = t.string :name

      t.timestamps
    end
  end
end
