require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品購入' do
    context '商品購入ができる時' do
      it '全ての項目がが存在すれば保購入できること' do
        expect(@user_order).to be_valid
      end

      it '建物名が無くても購入できること' do
        @user_order.building_name = ''
        expect(@user_order).to be_valid
      end

    end

    context '商品購入ができない時' do
      it 'tokenが空では登録できないこと' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では登録できないこと' do
        @user_order.postal_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeには(-)が無いと登録できないこと' do
        @user_order.postal_code = 1_234_567
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空では登録できないこと' do
        @user_order.prefecture_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが0では登録できないこと' do
        @user_order.prefecture_id = 0
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it 'municipalityが空では登録できないこと' do
        @user_order.municipality = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空では登録できないこと' do
        @user_order.address = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では登録できないこと' do
        @user_order.phone_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字でないと登録できないこと' do
        @user_order.phone_number = '０８０５５３７０５７１'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number Half-width number')
      end
      it 'phone_numberが11桁以内でないと登録できないこと' do
        @user_order.phone_number = '080553705711'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'phone_numberが英数混合では登録できないこと' do
        @user_order.phone_number = '08055370abc'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number Half-width number')
      end


      it 'userが空では登録できないこと' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが空では登録できないこと' do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
