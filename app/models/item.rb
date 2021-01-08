class Item < ApplicationRecord

  has_one_attached :image

  with_options presence: true do
    validates :product
    validates :explanation
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :delivery_area_id, numericality: { other_than: 0 }
    validates :delivery_day_id, numericality: { other_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end

  has_one :order_information
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_day

end
