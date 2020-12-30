FactoryBot.define do
  factory :item do
    product           { 'テスト' }
    explanation       { 'これはテストです' }
    category_id       { 2 }
    condition_id      { 2 }
    delivery_fee_id   { 2 }
    delivery_area_id  { 2 }
    delivery_day_id   { 2 }
    price             { 500 }

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      # インスタンス生成後に、pubricのダミー画像がインスタンスに格納されるように設定している
    end
  end
end
