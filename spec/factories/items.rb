FactoryBot.define do
  factory :item do
    text { 'aaaa' }
    name { 'aaaa' }
    status_id { 2 }
    burden_id { 2 }
    address_origin_id { 2 }
    delivery_time_id { 2 }
    genre_id { 2 }
    price { 300 }
    association :user
  end
end
