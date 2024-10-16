class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :order

  enum status: {
    pending: 0,
    confirmed: 1,
    preparing: 2,
    delivering: 3,
    delivered: 4,
    cancelled: 5
  }

  scope :read, ->{where(read: true)}
  scope :unread, ->{where(read: false)}
  scope :recent, ->{order(created_at: :desc)}
end
