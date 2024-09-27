class Category < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :name,
            presence: true,
            uniqueness: true,
            length: {maximum: Settings.value.max_category_name}
end
