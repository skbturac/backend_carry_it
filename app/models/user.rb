class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  has_many :packages, :through :services
  has_many :services
end
  # belongs_to :sender, class_name: "User"
  # belongs_to :carrier, class_name: "User"
  # belongs_to :packages
  
