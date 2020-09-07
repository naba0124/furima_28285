class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :genre
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :address_origin
  belongs_to_active_hash :burden
  belongs_to :user
  has_one :item_order
  has_many_attached :images

  with_options presence: true do
    validates :name, :images, :genre_id, :price, :text, :status_id, :address_origin_id, :burden_id
    validates :status_id, :genre_id, :address_origin_id, :burden_id, numericality: { other_than: 1 }
    validates :price, numericality: { greater_than: 299 }
    validates :price, numericality: { less_than_or_equal_to: 9_999_999 }
  end
end
