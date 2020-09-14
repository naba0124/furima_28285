class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :genre
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :address_origin
  belongs_to_active_hash :burden
  belongs_to :user
  has_many :comments
  has_one :item_order
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations
  has_many_attached :images

  
end
