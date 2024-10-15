class Review < ApplicationRecord
  REVIEW_REQUIRE_ATTRIBUTES = %i(rating comment).freeze
  belongs_to :product
  belongs_to :user

  validates :rating, presence: true,
            numericality: {greater_than_or_equal_to: Settings.value.rate_min,
                           less_than_or_equal_to: Settings.value.rate_max}
  validates :comment, length: {maximum: Settings.value.comment_length}

  scope :by_user_username, lambda {|username|
                             joins(:user).where(users: {user_name: username})
                           }

  scope :by_product_name, lambda {|product_name|
    joins(:product).where(
      "LOWER(products.name) LIKE ?",
      "%#{product_name.downcase}%"
    )
  }
  scope :sort_by_rating, ->(direction = "asc"){order(rating: direction)}
  scope :sort_by_created_at, lambda {|direction = "asc"|
                               order(created_at: direction)
                             }
  scope :by_rating, lambda {|rating|
                      where(rating:)
                    }
end
