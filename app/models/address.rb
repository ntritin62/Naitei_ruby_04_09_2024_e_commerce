class Address < ApplicationRecord
  belongs_to :user

  validates :receiver_name, presence: true,
            length: {maximum: Settings.value.max_receiver_name}
  validates :place, presence: true,
            length: {maximum: Settings.value.max_place_length}
  validates :phone, presence: true, length: {is: Settings.value.phone},
            format: {with: Settings.value.phone_format}
end
