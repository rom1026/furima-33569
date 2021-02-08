require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :katakana_last_name, :katakana_first_name, :birth_date)
  end

  describe "ユーザー新規登録" do

    context 'ユーザー登録ができる時' do
      it '全ての項目が存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上あれば登録できること' do
        @user.password = '1234567'
        @user.password_confirmation = '123456'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない時' do

      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームが空だと登録できない")
      end
  
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("emailが空では登録できない")   
      end
      it "emailは一意性であること" do
        @user.save
        another = FactoryBot.build(:email)
        another.email = @user.email
        another.valid?
        expect(@user.errors.full_messages).to include("このアドレスは既に登録されています")   
      end
      it "emailは＠を含むこと" do
        @user.email = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("＠を入れたアドレスを入力してください")   
      end

      it "パスワードが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが空では登録できない")    
      end
      it "パスワードは６文字以上でないと登録できないこと" do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは６文字以上でないと登録できません")    
      end
      it "パスワードは英語のみでは登録できないこと" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英語のみでは登録できません")    
      end
      it "パスワードは数字のみでは登録できないこと" do
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは数字のみでは登録できません")    
      end
      it "パスワードは全角では登録できないこと" do
        @user.password_confirmation = "ABCD1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは全角では登録できません")    
      end
  
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（全角）が空では登録できない")    
      end
      it "last_nameは漢字・平仮名・カタカナ以外では登録できないこと" do
        @user.last_name = "abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（全角）は漢字・平仮名・カタカナ以外では登録できないこと")    
      end

  
      it "First_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（全角）が空では登録できない")    
      end
      it "First_nameは漢字・平仮名・カタカナ以外では登録できないこと" do
        @user.first_name = "abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（全角）は漢字・平仮名・カタカナ以外では登録できないこと")    
      end

  
      it "katakana_last_nameが空では登録できない" do
        @user.katakana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（カナ）が空では登録できない")    
      end
      it "katakana_last_nameが全角カタカナ以外では登録できないこと" do
        @user.katakana_last_name = "abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（カナ）は漢字・平仮名・カタカナ以外では登録できないこと")    
      end
  
      it "katakana_first_nameが空では登録できない" do
        @user.katakana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（カナ）が空では登録できない")    
      end
      it "katakana_first_nameが全角カタカナ以外では登録できないこと" do
        @user.katakana_first_name = "abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（カナ）は漢字・平仮名・カタカナ以外では登録できないこと")    
      end
      
      it "birth_dateが空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日が空では登録できない")    
      end

    end
    
  end
   
end