class User < ApplicationRecord
  has_many :items
  has_one :address

  hankaku = /\A[a-z0-9]+\z/i
  zenkaku = /\A[ぁ-んァ-ン一-龥]/
  zenkaku_kana = /\A[ァ-ヶー－]+\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, :password_confirmation, :birthday, :firstname, :lastname, presence: true
  validates :email, uniqueness: true # アドレスが重複してはいけない
  validates :password, confirmation: true # 確認用パスワードと値が一致しなくてはならない
  with_options presence: true do
    validates :password, format: { with: hankaku } # 半角英数字のみ
    validates :firstname, :lastname, format: { with: zenkaku } # 全角ひらがなカタカナ漢字のみ
    validates :firstname_kana, :lastname_kana, format: { with: zenkaku_kana } # 全角カタカナのみ
    validates :firstname, :lastname, format: { with: zenkaku }
  end
end
