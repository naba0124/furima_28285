require 'rails_helper'
describe User do
  describe '出品' do
    before do
      @user = FactoryBot.create(:user)
      @item_text = Faker::Lorem.sentence
      @item_image = Faker::Lorem.sentence
    end
    context '出品ページへ遷移できるとき' do
      it 'ログインしたユーザーは出品できる' do
        visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        find('input[name="commit"]').click
        expect(current_path).to eq root_path
        expect(page).to have_content('出品')
        visit new_item_path
      end
    end
    context '出品ページへ遷移できない時' do
      it 'ログインしてないと出品ページへ遷移できない' do
        visit root_path
      end
    end
  end
end
