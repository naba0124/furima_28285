class Address < ApplicationRecord
  belongs_to :user

  postal = /\A\d{3}[-]\d{4}\z/
  tel = /\A\d{11}\z/

  validates :address_origin_id, :city, :address, :tel, :post_number, presence: true
  with_options presence: true do
    validates :post_number, format: { with: postal }
    validates :tel, format: { with: tel }
  end
end
