require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    context 'ユーザー登録ができる時' do
      it '全ての項目が存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上あれば登録できること' do
        @user.password = "shimano1026"
        @user.password_confirmation = "shimano1026"
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない時' do

      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")   
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは＠を含むこと" do
        @user.email = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")   
      end

      it "パスワードが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password パスワードは６文字以上で入力してください", "Password パスワードは英数字混合にしてください", "Password confirmation doesn't match Password")    
      end
      it "パスワードは６文字以上でないと登録できないこと" do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)", "Password パスワードは６文字以上で入力してください", "Password パスワードは英数字混合にしてください")    
      end
      it "パスワードは英語のみでは登録できないこと" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password パスワードは英数字混合にしてください")    
      end
      it "パスワードは数字のみでは登録できないこと" do
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")    
      end
      it "パスワードは全角では登録できないこと" do
        @user.password_confirmation = "ABCD1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")    
      end
  
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name お名前（全角）は全角で入力してください")    
      end
      it "last_nameは漢字・平仮名・カタカナ以外では登録できないこと" do
        @user.last_name = "abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name お名前（全角）は全角で入力してください")    
      end

  
      it "First_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name お名前（全角）は全角で入力してください")    
      end
      it "First_nameは漢字・平仮名・カタカナ以外では登録できないこと" do
        @user.first_name = "abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name お名前（全角）は全角で入力してください")    
      end

  
      it "katakana_last_nameが空では登録できない" do
        @user.katakana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana last name can't be blank", "Katakana last name お名前カナ（全角）は全角カタカナで入力してください")    
      end
      it "katakana_last_nameが全角カタカナ以外では登録できないこと" do
        @user.katakana_last_name = "abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana last name お名前カナ（全角）は全角カタカナで入力してください")    
      end
  
      it "katakana_first_nameが空では登録できない" do
        @user.katakana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first name can't be blank", "Katakana first name お名前カナ（全角）は全角カタカナで入力してください")    
      end
      it "katakana_first_nameが全角カタカナ以外では登録できないこと" do
        @user.katakana_first_name = "abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first name お名前カナ（全角）は全角カタカナで入力してください")    
      end
      
      it "birth_dateが空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")    
      end

    end
    
  end
   
end