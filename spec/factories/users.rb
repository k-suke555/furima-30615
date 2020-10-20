FactoryBot.define do
  factory :user do
    nickname              {"たなか"}
    email                 {"abc@gmail.com"}
    password              {"111aaa"}
    password_confirmation {password}
    last_name_kanji       {"田中"}
    first_name_kanji      {"太郎"}
    last_name_kana        {"タナカ"}
    first_name_kana       {"タロウ"}
    birthday              {"1990-09-01"}
  end
end