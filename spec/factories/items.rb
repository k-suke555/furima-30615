FactoryBot.define do
  factory :item do
    name        { '大分' }
    description { '山です' }
    category_id  { 5 }
    burden_id    { 3 }
    status_id    { 2 }
    area_id      { 6 }
    days_to_ship_id { 3 }
    price { 300 }

    association :user
    after(:build) do |item|
      # io; File.openで設定したパスのファイル(public/images/test_image.png)をtest_image.pngというファイル名で保存する。
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
