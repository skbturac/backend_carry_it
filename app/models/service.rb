class Service < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :carrier, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :package
end
