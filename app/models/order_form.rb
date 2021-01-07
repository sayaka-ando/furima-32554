class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :delivery_area_id, :city, :address, :building, :phone_number, :order_information_id
  #user_id = 1, postal_code = 000-0000 
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :delivery_area_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/ }

  def save
    order = OrderInformation.create(user_id: user_id, item_id: item_id)#（カラム名： 実際のデータ,カラム名： 実際のデータ)
    Address.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, address: address, building: building, phone_number: phone_number, order_information_id: order.id)
  end
  
end
