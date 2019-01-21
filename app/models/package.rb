class Package < ApplicationRecord
  # has_many :users, through: :services
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_one :service
end
 
