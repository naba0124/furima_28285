require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品情報の保存' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end
    context "出品情報の保存ができる場合" do
      it "name,text,image,status,genre,delivery_times,burden,address_origin,priceがあれば保存される" do
        expect(@item).to be_valid
      end
      it "priceが300以上なら出品できる" do
        @item.price = "300"
        expect(@item).to be_valid
      end
      it "priceが9999999以下なら出品できる" do
        @item.price = "9999999"
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかない時' do
      it "nameが空では登録できない" do
        item = FactoryBot.build(:item)
        item.name = ""
        item.valid?
        expect(item.errors.full_messages).to include("Name can't be blank")
      end
      it "imageが空では登録できない" do
        item = FactoryBot.build(:item)
        @item.image = nil
        item.valid?
        expect(item.errors.full_messages).to include("Image can't be blank")
      end
      it "textが空では登録できない" do
        item = FactoryBot.build(:item)
        item.text = ""
        item.valid?
        expect(item.errors.full_messages).to include("Text can't be blank")
      end
      it "priceが空では登録できない" do
        item = FactoryBot.build(:item)
        item.price = ""
        item.valid?
        expect(item.errors.full_messages).to include("Price can't be blank")
      end
      it "statusが空では登録できない" do
        item = FactoryBot.build(:item)
        item.status_id = ""
        item.valid?
        expect(item.errors.full_messages).to include("Status can't be blank")
      end
      it "genreが空では登録できない" do
        item = FactoryBot.build(:item)
        item.genre_id = ""
        item.valid?
        expect(item.errors.full_messages).to include("Genre can't be blank")
      end
      it "address_originが空では登録できない" do
        item = FactoryBot.build(:item)
        item.address_origin_id = ""
        item.valid?
        expect(item.errors.full_messages).to include("Address origin can't be blank")
      end
      it "burdenが空では登録できない" do
        item = FactoryBot.build(:item)
        item.burden_id = ""
        item.valid?
        expect(item.errors.full_messages).to include("Burden can't be blank")
      end
      it "delivery_timeが空では登録できない" do
        item = FactoryBot.build(:item)
        item.delivery_time_id = ""
        item.valid?
        expect(item.errors.full_messages).to include("Image can't be blank")
      end

    end
  end
end