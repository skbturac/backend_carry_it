class UserSerializer < ActiveModel::Serializer
  attributes :username, :avatar, :bio, :first_name, :last_name, :email_address, :home_address, :phone_number, :id
  has_many :packages, class_name: "Package", foreign_key: "sender_id"
  has_many :incoming_packages, class_name: "Package", foreign_key: "receiver_id"
  has_many :service_carrier, class_name: "Service", foreign_key: "carrier_id"
end
