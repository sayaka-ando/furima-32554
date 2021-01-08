class Address < ApplicationRecord

  belongs_to :order_information

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_area

end
