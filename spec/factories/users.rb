FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 6)
    nickname               {Faker::Name.initials(number: 2)}
    email                  {Faker::Internet.free_email}
    password               { password }
    password_confirmation  { password }
    family_name            {"田中"}
    first_name             {"太郎"}
    family_name_kana       {"タナカ"}
    first_name_kana        {"タロウ"}
    birthday               {"2020-12-22"}
  end
end