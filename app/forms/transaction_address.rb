class TransactionAddress

  include ActiveModel::Model
  attr_accessor :address_origin_id, :city, :address, :tel, :post_number, :build_number, :user_id, :item_id

  postal = /\A\d{3}[-]\d{4}\z/
  tel = /\A\d{11}\z/
  validates :address_origin_id, :city, :address, :tel, :post_number, presence: true
  with_options presence: true do
    validates :post_number, format: { with: postal }
    validates :tel, format: { with: tel }
  end

  def save
    Address.create(address_origin_id: address_origin_id, city: city, address: address, tel: tel, post_number: post_number, build_number: build_number)
    Transaction.create(user_id: user_id, item_id: item_id)
  end

end