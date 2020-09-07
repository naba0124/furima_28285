require 'rails_helper'
describe User do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation,birthday,nameが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.email = 'kkk@gmail.com'
        expect(@user).to be_valid
      end
      it 'firstname_kanaがカタカナでないと登録できないこと' do
        @user.firstname_kana = 'カタカナ'
        expect(@user).to be_valid
      end
      it 'lastname_kanaがカタカナでないと登録できないこと' do
        @user.lastname_kana = 'カタカナ'
        expect(@user).to be_valid
      end
      it 'メールアドレスは@を含む必要があること' do
        @user.email = 'kkk@gmail.com'
        expect(@user).to be_valid
      end
      it 'firstnameが全角でないと登録できない' do
        @user.firstname = '田中'
        expect(@user).to be_valid
      end
      it 'lastnameが全角でないと登録できない' do
        @user.lastname = '太郎'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameがからでは登録できない' do
        user = FactoryBot.build(:user)
        user.nickname = ''
        user.valid?
        expect(user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        user = FactoryBot.build(:user)
        user.email = ''
        user.valid?
        expect(user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'passwordが空では登録できない' do
        user = FactoryBot.build(:user)
        user.password = ''
        user.valid?
        expect(user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'birthdayが空では登録できない' do
        user = FactoryBot.build(:user)
        user.birthday = ''
        user.valid?
        expect(user.errors.full_messages).to include("生年月日を入力してください")
      end
      it 'firstnameが空では登録できない' do
        user = FactoryBot.build(:user)
        user.firstname = ''
        user.valid?
        expect(user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'firstname_kanaが空では登録できない' do
        user = FactoryBot.build(:user)
        user.firstname_kana = ''
        user.valid?
        expect(user.errors.full_messages).to include("苗字カナを入力してください")
      end
      it 'lastnameが空では登録できない' do
        user = FactoryBot.build(:user)
        user.lastname = ''
        user.valid?
        expect(user.errors.full_messages).to include("名前を入力してください")
      end
      it 'lastname_kanaが空では登録できない' do
        user = FactoryBot.build(:user)
        user.lastname_kana = ''
        user.valid?
        expect(user.errors.full_messages).to include("名前カナを入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        user = FactoryBot.build(:user)
        user.password_confirmation = ''
        user.valid?
        expect(user.errors.full_messages).to include("確認用パスワードを入力してください")
      end
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'firstname_kanaがカタカナでないと登録できないこと' do
        user = FactoryBot.build(:user)
        user.firstname_kana = 'aaa'
        user.valid?
        expect(user.errors.full_messages).to include('苗字カナは不正な値です')
      end
      it 'lastname_kanaがカタカナでないと登録できないこと' do
        user = FactoryBot.build(:user)
        user.lastname_kana = 'aaa'
        user.valid?
        expect(user.errors.full_messages).to include('名前カナは不正な値です')
      end
      it 'メールアドレスは@を含む必要があること' do
        user = FactoryBot.build(:user)
        user.email = 'kkkgmail.com'
        user.valid?
        expect(user.errors.full_messages).to include 'メールアドレスは不正な値です'
      end
      it 'firstnameが全角でないと登録できない' do
        user = FactoryBot.build(:user)
        user.firstname = 'tanaka'
        user.valid?
        expect(user.errors.full_messages).to include('苗字は不正な値です')
      end
      it 'lastnameが全角でないと登録できない' do
        user = FactoryBot.build(:user)
        user.lastname = 'tanaka'
        user.valid?
        expect(user.errors.full_messages).to include('名前は不正な値です')
      end
    end
  end
end
