class AddOrderToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :order, null: false, foreign_key: true
  end
end
