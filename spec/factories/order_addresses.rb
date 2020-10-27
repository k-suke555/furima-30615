
FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '福岡市' }
    house_number { '1-1' }
    building_name { '福岡ハイツ' }
    phone_number { '09012345678' }
  end
end
