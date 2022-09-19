class User < ApplicationRecord
  has_many :expenditures
  has_many :groups
end
