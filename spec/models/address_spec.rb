require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '購入情報の保存' do
    before do
      @address = FactoryBot.build(:address)
    end
    context '購入情報の保存ができる場合' do
      it 'post_number,address_origin_id,city,address,telがあれば保存される' do
        expect(@address).to be_valid
      end
      it '郵便番号は-を含み、７桁あること' do
        @address.post_number = '123-4456'
        expect(@address).to be_valid
      end
      it '電話番号はハイフンなしで１１桁以内であること' do
        @address.tel = '09012345678'
        expect(@address).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'post_numberが空では登録できない' do
        address = FactoryBot.build(:address)
        address.post_number = ''
        address.valid?
        expect(address.errors.full_messages).to include("Post number can't be blank")
      end
      it 'address_origin_idが空では登録できない' do
        address = FactoryBot.build(:address)
        address.address_origin_id = ''
        address.valid?
        expect(address.errors.full_messages).to include("Address origin can't be blank")
      end
      it 'cityが空では登録できない' do
        address = FactoryBot.build(:address)
        address.city = ''
        address.valid?
        expect(address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では登録できない' do
        address = FactoryBot.build(:address)
        address.address = ''
        address.valid?
        expect(address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空では登録できない' do
        address = FactoryBot.build(:address)
        address.tel = ''
        address.valid?
        expect(address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが11桁以上でハイフンありは登録できない' do
        address = FactoryBot.build(:address)
        address.tel = '1234567-89123'
        address.valid?
        expect(address.errors.full_messages).to include('Tel is invalid')
      end
      it 'post_numberがハイフンなしで７桁以外は登録できない' do
        address = FactoryBot.build(:address)
        address.post_number = '123456789123'
        address.valid?
        expect(address.errors.full_messages).to include('Post number is invalid')
      end
    end
  end
end
