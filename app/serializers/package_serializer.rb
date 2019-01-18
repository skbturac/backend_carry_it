class PackageSerializer < ActiveModel::Serializer
  # attributes :weight, :height, :length, :description, :image, :sender_id, :receiver_id, :id
  attributes :weight, :height, :length, :description, :image, :id
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
