class ItemTag
  include ActiveModel::Model
  attr_accessor :name, :images, :genre_id, :price, :text, :status_id, :address_origin_id, :burden_id, :delivery_time_id, :user_id

  with_options presence: true do
    validates :name, :images, :genre_id, :price, :text, :status_id, :address_origin_id, :burden_id
    validates :status_id, :genre_id, :address_origin_id, :burden_id, :delivery_time_id, numericality: { other_than: 1 }
    validates :price, numericality: { greater_than: 299 }
    validates :price, numericality: { less_than_or_equal_to: 9_999_999 }
  end

  

  def save
    item = Item.new(name: name, text: text, status_id: status_id, burden_id: burden_id, address_origin_id: address_origin_id, delivery_time_id: delivery_time_id, genre_id: genre_id, price: price, images: images, user_id: user_id)
    item.save
    # item.images.attach(images[0])
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end