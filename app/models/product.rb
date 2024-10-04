class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_item, dependent: :destroy
  has_many :order_item, dependent: :nullify
  has_many :reviews, dependent: :destroy

  scope :search_by_name, ->(query){where("name LIKE ?", "%#{query}%")}

  validates :name, presence: true
  validates :price, presence: true,
    numericality: {greater_than_or_equal_to: Settings.value.min_numeric}
  validates :stock, presence: true,
    numericality: {greater_than_or_equal_to: Settings.value.min_numeric}
  validates :rating,
            numericality: {greater_than_or_equal_to: Settings.value.min_numeric,
                           less_than_or_equal_to: Settings.value.rate_max},
            allow_nil: true
end
