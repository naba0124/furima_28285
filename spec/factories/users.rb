FactoryBot.define do
  factory :user do
    nickname          {"aaa"}
    email             {"kkk@gamail.com"}
    password          {"000000"}
    password_confirmation {password}
    birthday          {"2020-01-01"}
    firstname         {"名前"}
    lastname          {"名前"}
    firstname_kana    {"カタカナ"}
    lastname_kana     {"カタカナ"}
  end
end