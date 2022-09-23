class AddGroupToExpenditure < ActiveRecord::Migration[7.0]
  def change
    add_column :expenditures, :group_id, :integer
  end
end
