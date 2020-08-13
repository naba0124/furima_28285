class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  hankaku = "/\A[a-z0-9]+\z/i"
  zenkaku = "/\A[ぁ-んァ-ン一-龥]/"
  zenkaku_kana = "/\A[ァ-ヶー－]+\z/"
  validates :nickname, :email, :password_confirmation, :birthday, :firstname, :lastname, presence: true
  validates :email, uniqueness: true # アドレスが重複してはいけない
  validates :password, confirmation: true #確認用パスワードと値が一致しなくてはならない
  with_options presence: true do
    validates :password, format: { with: /#{hankaku}/ } # 半角英数字のみ
    validates :firstname, :lastname, format: { with: /#{zenkaku}/ } # 全角ひらがなカタカナ漢字のみ
    validates :firstname_kana, :lastname_kana, format: { with: /#{zenkaku_kana}/ } # 全角カタカナのみ
  end
  
  


end
