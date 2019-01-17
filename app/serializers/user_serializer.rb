class UserSerializer < ActiveModel::Serializer
  attributes :username, :avatar, :bio, :first_name, :last_name, :email_address, :home_address, :phone_number, :id
end
