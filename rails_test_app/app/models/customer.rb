class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy

  # Virtual attribute for testing / easy transient use
  attr_accessor :credit_card_number
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :days_to_pay, numericality: { only_integer: true, greater_than: 0 }
  validates :vip, inclusion: { in: [true, false] }

  def full_name
      "Mr./Ms. #{name}"
  end
end
