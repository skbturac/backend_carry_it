class Service < ApplicationRecord
  belongs_to :package
  belongs_to :carrier, class_name: "User"
  # validates :package, presence: true
end
