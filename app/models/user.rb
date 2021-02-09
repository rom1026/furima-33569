class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :katakana_last_name
    validates :katakana_first_name
    validates :birth_date
  end
      
  validates :password, length: { minimum: 6, message: "パスワードは６文字以上で入力してください" }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'パスワードは英数字混合にしてください'  }
  validates :email, format: { with: /@+/, message: '@を使ったアドレスで入力してください' }
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'お名前（全角）は全角で入力してください' }
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'お名前（全角）は全角で入力してください' }
  validates :katakana_last_name, format: { with: /\A[\p{katakana}\u{30fc}]+\z/, message: 'お名前カナ（全角）は全角カタカナで入力してください'  }
  validates :katakana_first_name, format: { with: /\A[\p{katakana}\u{30fc}]+\z/, message: 'お名前カナ（全角）は全角カタカナで入力してください'  }


end
