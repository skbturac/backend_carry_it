class Service < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :carrier, class_name: "User"
  belongs_to :reciever, class_name: "User"
  belongs_to :packages
end
