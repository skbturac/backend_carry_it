class ServiceSerializer < ActiveModel::Serializer
  attributes :status, :price, :destination_address, :id, :carrier_details
  belongs_to :package
  belongs_to :carrier, class_name: "User"

  def carrier_details
    return {
      first_name: object.carrier.first_name,
      last_name: object.carrier.last_name,
      id: object.carrier.id,
      avatar: object.carrier.avatar
    }
  end
end
