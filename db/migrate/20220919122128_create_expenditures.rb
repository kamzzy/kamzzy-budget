class CreateExpenditures < ActiveRecord::Migration[7.0]
  def change
    create_table :expenditures do |t|
      t.references :user, null: false, foreign_key: true, index: true
      name = t.string :name
      amount = t.integer :amount
      group_id = t.integer :group_id

      t.timestamps
    end
  end
end
