require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品情報の保存' do
    before do
      @item = FactoryBot.build(:item)
      @item.images.attach(io:  Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/files/test_image.png')), filename: 'test_image.png', content_type: 'image/png')
      binding.pry
      # @items = FactoryBot.build(:item, :with_image)
      # @item.images = []
      # 3.times do
      # #   @item.images = 
      #   @item.images = fixture_file_upload('public/images/test_image.png' )
      # binding.pry
      # end

    end
    context '出品情報の保存ができる場合' do
      it 'name,text,images,status,genre,delivery_time,burden,address_origin,priceがあれば保存される' do
        # @items
        # @item = FactoryBot.build(:item, :with_image)
        expect(@item).to be_valid
      end
      it 'priceが300以上なら出品できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
      it 'priceが9999999以下なら出品できる' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかない時' do
      it 'priceが300以下なら出品できない' do
        item = FactoryBot.build(:item)
        @item.price = '299'
        item.valid?
        expect(item.errors.full_messages).to include("画像を入力してください")
      end
      it 'priceが9999999以上なら出品できない' do
        item = FactoryBot.build(:item)
        @item.price = '10000000'
        item.valid?
        expect(item.errors.full_messages).to include("画像を入力してください")
      end
      it 'nameが空では登録できない' do
        item = FactoryBot.build(:item)
        item.name = ''
        item.valid?
        expect(item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'imagesが空では登録できない' do
        item = FactoryBot.build(:item)
        @item.images = nil
        item.valid?
        expect(item.errors.full_messages).to include("画像を入力してください")
      end
      it 'textが空では登録できない' do
        item = FactoryBot.build(:item)
        item.text = ''
        item.valid?
        expect(item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'priceが空では登録できない' do
        item = FactoryBot.build(:item)
        item.price = ''
        item.valid?
        expect(item.errors.full_messages).to include("金額を入力してください")
      end
      it 'statusが空では登録できない' do
        item = FactoryBot.build(:item)
        item.status_id = ''
        item.valid?
        expect(item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'genreが空では登録できない' do
        item = FactoryBot.build(:item)
        item.genre_id = ''
        item.valid?
        expect(item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'address_originが空では登録できない' do
        item = FactoryBot.build(:item)
        item.address_origin_id = ''
        item.valid?
        expect(item.errors.full_messages).to include("発送元を入力してください")
      end
      it 'burdenが空では登録できない' do
        item = FactoryBot.build(:item)
        item.burden_id = ''
        item.valid?
        expect(item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'delivery_timeが空では登録できない' do
        item = FactoryBot.build(:item)
        item.delivery_time_id = ''
        item.valid?
        expect(item.errors.full_messages).to include("画像を入力してください")
      end
    end
  end
end