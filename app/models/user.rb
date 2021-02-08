class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /^[0-9a-zA-Z]*$/, message: '半角英数字で入力してください'  }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '英数字混合にしてください'  }
  validates :email, presence: true, format: { with: /@+/, message: '@を使ったアドレスで入力してください' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角で入力してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角で入力してください' }
  validates :katakana_last_name, presence: true, format: { with: /\A[\p{katakana}\u{30fc}]+\z/, message: '全角カタカナで入力してください'  }
  validates :katakana_first_name, presence: true, format: { with: /\A[\p{katakana}\u{30fc}]+\z/, message: '全角カタカナで入力してください'  }
  validates :birth_date, presence: true


end
