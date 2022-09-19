class Expenditure < ApplicationRecord
  belongs_to :user
  has_many :group_expenditures
end
