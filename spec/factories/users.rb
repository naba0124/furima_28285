FactoryBot.define do
  factory :user do
    nickname          {Faker::Name.initials(number: 2)}
    email             {Faker::Internet.free_email}
    password          {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday          {"2020-01-01"}
    firstname         {"名前"}
    lastname          {"名前"}
    firstname_kana    {"カタカナ"}
    lastname_kana     {"カタカナ"}
  end
end