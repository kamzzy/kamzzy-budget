class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenditures, dependent: :destroy
end
