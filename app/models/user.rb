class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :password, :password_confirmation, :birthday, :firstname, :lastname, :firstname_kana, :lastname_kana, presence: true
  validates :email, uniqueness: true # アドレスが重複してはいけない
  validates :password, confirmation: true #確認用パスワードと値が一致しなくてはならない
  validates :password, length: { minimum: 6 }#６文字以上でないと保存できない
  validates :password, format: { with: /\A[a-z0-9]+\z/i } # 半角英数字のみ
  validates :firstname, :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/ } # 全角ひらがなカタカナ漢字のみ
  validates :firstname_kana, :lastname_kana, format: { with: /\A[ァ-ヶー－]+\z/ } # 全角カタカナのみ
  


end
