require 'rails_helper'

RSpec.describe User, type: :model do
  config.include FactoryBot::Syntax::Methods
  describe "ユーザー新規登録" do

    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name:"abe", first_name:"abe", katakana_last_name:"abe", katakana_first_name:"abe", birth_date:"1996年10月26日")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000", last_name:"abe", first_name:"abe", katakana_last_name:"abe", katakana_first_name:"abe", birth_date:"1996年10月26日")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")   
    end

    it "パスワードが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "", password_confirmation: "00000000", last_name:"abe", first_name:"abe", katakana_last_name:"abe", katakana_first_name:"abe", birth_date:"1996年10月26日")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")    
    end

    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "", last_name:"abe", first_name:"abe", katakana_last_name:"abe", katakana_first_name:"abe", birth_date:"1996年10月26日")
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")    
    end

    it "last_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name:"", first_name:"abe", katakana_last_name:"abe", katakana_first_name:"abe", birth_date:"1996年10月26日")
      user.valid?
      expect(user.errors.full_messages).to include("Last_name can't be blank")    
    end

    it "First_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name:"abe", first_name:"", katakana_last_name:"abe", katakana_first_name:"abe", birth_date:"1996年10月26日")
      user.valid?
      expect(user.errors.full_messages).to include("First_name can't be blank")    
    end

    it "katakana_last_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name:"abe", first_name:"abe", katakana_last_name:"", katakana_first_name:"abe", birth_date:"1996年10月26日")
      user.valid?
      expect(user.errors.full_messages).to include("Katakana_last_name can't be blank")    
    end


    it "katakana_first_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name:"abe", first_name:"abe", katakana_last_name:"abe", katakana_first_name:"", birth_date:"1996年10月26日")
      user.valid?
      expect(user.errors.full_messages).to include("Katakana_first_name can't be blank")    
    end
    
    it "birth_dateが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name:"abe", first_name:"abe", katakana_last_name:"abe", katakana_first_name:"abe", birth_date:"1996年10月26日")
      user.valid?
      expect(user.errors.full_messages).to include("Birth_date can't be blank")    
    end
    
  end
   
end