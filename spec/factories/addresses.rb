FactoryBot.define do
  factory :address do
    post_number           { "123-4567" }
    address_origin_id     { 3 }
    city                  { "相模原市" }
    address               { "相模原3-123" }
    tel                   { "09012345678"}
    association :user
  end
end
