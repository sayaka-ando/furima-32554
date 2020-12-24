class Item < ApplicationRecord

  with_options presence: true do
    validates :product
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :delivery_area_id
    validates :delivery_day_id
    validates :price, format: { with: /d }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :user
  end

  has_one :buyers
  belongs_to :users
end
