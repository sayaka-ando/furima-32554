FactoryBot.define do
  factory :order_form do
    postal_code       { '000-0000' }
    delivery_area_id  { 1 }
    city              { '名古屋市' }
    address           { '1丁目' }
    building          { '建物' }
    phone_number      { '00000000000' }
    token             {"tok_abcdefghijk00000000000000000"}
    user_id           { 1 }
    item_id           { 1 }
  end
end
