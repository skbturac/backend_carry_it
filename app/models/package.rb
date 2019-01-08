class Package < ApplicationRecord
  has_many :packages, :through :users
  has_many :users
end
