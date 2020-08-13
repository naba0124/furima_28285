require 'rails_helper'
describe User do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "nicknameがからでは登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "birthdayが空では登録できない" do
      user = FactoryBot.build(:user)
      user.birthday = ""
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "firstnameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.firstname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Firstname can't be blank")
    end
    it "firstname_kanaが空では登録できない" do
      user = FactoryBot.build(:user)
      user.firstname_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("Firstname kana can't be blank")
    end
    it "lastnameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.lastname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Lastname can't be blank")
    end
    it "lastname_kanaが空では登録できない" do
      user = FactoryBot.build(:user)
      user.lastname_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("Lastname kana can't be blank")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password_confirmation = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = '12345'
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Firstname is invalid")
    end
    it "firstname_kanaがカタカナでないと登録できないこと" do
      user = FactoryBot.build(:user)
      user.firstname_kana = "aaa"
      user.valid?
      expect(user.errors.full_messages).to include("Firstname kana is invalid")
    end
    it "lastname_kanaがカタカナでないと登録できないこと" do
      user = FactoryBot.build(:user)
      user.lastname_kana = "aaa"
      user.valid?
      expect(user.errors.full_messages).to include("Lastname kana is invalid")
    end
    it "メールアドレスは@を含む必要があること" do
      user = FactoryBot.build(:user)
      user.email = "kkk@gmail.com"
      user.valid?
      expect(user.errors.full_messages).to include("Firstname is invalid")
    end

  end

end