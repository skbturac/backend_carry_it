class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  # has_many :services
  has_many :packages, class_name: "Package", foreign_key: "sender_id"
  has_many :incoming_packages, class_name: "Package", foreign_key: "receiver_id"
  has_many :service_carrier, class_name: "Service", foreign_key: "carrier_id"

  def full_name
    @first_name + @last_name
  end
end
