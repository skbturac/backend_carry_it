class PackageSerializer < ActiveModel::Serializer
  attributes :weight, :height, :length, :description, :image, :sender_id, :receiver_id
end
