FactoryBot.define do
  factory :order_form do
    postal_code       { '000-0000' }
    delivery_area_id  { 1 }
    city              { '名古屋市' }
    address           { '1丁目' }
    phone_number      { '00000000000' }
  end
end
