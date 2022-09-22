class Group < ApplicationRecord
  belongs_to :user
  has_many :group_expenditures
  has_many :expenditures, through: :group_expenditures
end
