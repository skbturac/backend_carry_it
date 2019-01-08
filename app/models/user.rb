class User < ApplicationRecord
  has_secure_password
  # validates :username, uniqueness: { case_sensitive: false }
  # has_many :services
  has_many :service_sender, class_name: "Service", foreign_key: "sender_id"
  has_many :service_receiver, class_name: "Service", foreign_key: "receiver_id"
  has_many :service_carrier, class_name: "Service", foreign_key: "carrier_id"
  has_many :packages, through: :services
end
