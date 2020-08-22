class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string       :post_number,     default: "",   null: false
      t.integer      :address_origin_id,              null: false
      t.string       :city,            default: "",   null: false
      t.string       :address,         default: "",   null: false
      t.string       :tel,             default: "",   null: false
      t.string       :build_number,    default: "" 
      t.references   :user,                           null: false, foreign_key: true
      t.timestamps
    end
  end
end
