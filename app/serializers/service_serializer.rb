class ServiceSerializer < ActiveModel::Serializer
  attributes :status, :price, :destination_address, :destination_zipcode, :id
  belongs_to :package
  belongs_to :carrier, class_name: "User"
end
