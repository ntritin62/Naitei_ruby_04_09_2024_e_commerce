class Address < ApplicationRecord
  ADDRESS_REQUIRE_ATTRIBUTES = %i(receiver_name place phone default).freeze
  belongs_to :user

  validates :receiver_name, presence: true,
            length: {maximum: Settings.value.max_receiver_name}
  validates :place, presence: true,
            length: {maximum: Settings.value.max_place_length}
  validates :phone, presence: true, format: {with: Settings.value.phone_format}

  scope :ordered_by_updated_at, ->{order(updated_at: :desc)}
  scope :default_address, ->{where(default: true)}
  scope :not_default_address, ->{where(default: false)}

  class << self
    def set_default_false user
      user.addresses.update_all(default: false)
    end
  end

  def full_address
    I18n.t("address.full_address", receiver_name:, place:,
phone:)
  end
end
