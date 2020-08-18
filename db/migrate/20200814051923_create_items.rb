class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,          null:false
      t.integer :genre_id,      null:false
      t.integer :price,         null:false
      t.integer :user_id,       null:false,foreign_key: true
      t.text    :text,          null:false
      t.integer :status_id,        null:false
      t.integer :address_origin_id, null:false
      t.integer :burden_id,        null:false
      t.integer :delivery_time_id, null:false

      t.timestamps
    end
  end
end
