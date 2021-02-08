class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :nickname, presence: true
  validates :password, length: { minimum: 6, message: "パスワードは６文字以上で入力してください" }, format: { with: /^[0-9a-zA-Z]*$/, message: 'パスワードは半角英数字で入力してください'  }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'パスワードは英数字混合にしてください'  }
  validates :email, format: { with: /@+/, message: '@を使ったアドレスで入力してください' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'お名前（全角）は全角で入力してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'お名前（全角）は全角で入力してください' }
  validates :katakana_last_name, presence: true, format: { with: /\A[\p{katakana}\u{30fc}]+\z/, message: 'お名前カナ（全角）は全角カタカナで入力してください'  }
  validates :katakana_first_name, presence: true, format: { with: /\A[\p{katakana}\u{30fc}]+\z/, message: 'お名前カナ（全角）は全角カタカナで入力してください'  }
  validates :birth_date, presence: true


end
