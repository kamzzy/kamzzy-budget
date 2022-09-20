class CreateGroupExpenditures < ActiveRecord::Migration[7.0]
  def change
    create_table :group_expenditures do |t|
      t.belongs_to :group
      t.belongs_to :expenditure
      t.timestamps
    end
  end
end
