class Category < ApplicationRecord
  has_many :products, dependent: :nullify

  scope :search_by_name, ->(query){where("name LIKE ?", "%#{query}%")}

  validates :name,
            presence: true,
            uniqueness: true,
            length: {maximum: Settings.value.max_category_name}
end
