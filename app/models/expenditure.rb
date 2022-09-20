class Expenditure < ApplicationRecord
  belongs_to :user
  has_many :group_expenditures
  has_many :groups, through: :group_expenditures
end
