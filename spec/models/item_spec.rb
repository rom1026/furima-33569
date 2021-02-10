require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品出来る時" do

    context 'ユーザー登録ができる時' do

      it '全ての項目が存在すれば出品できること' do
        expect(@item).to be_valid
      end

    end
    
  end

  context 'ユーザー登録ができない時' do

    it "product_nameが空だと登録できない" do
      @item.product_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it "product_detailsが空では登録できない" do
      @item.product_details = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product details can't be blank")   
    end

    it "categoryが空では登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")    
    end

    it "product_statusが空では登録できない" do
      @item.product_status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status can't be blank")    
    end

    it "shipping_chargeが空では登録できない" do
      @item.shipping_charge_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")    
    end

    it "prefectureが空では登録できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")    
    end

    it "days_to_shipが空では登録できない" do
      @item.days_to_ship_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")    
    end

    it "selling_priceが空では登録できない" do
      @item.selling_price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price can't be blank")    
    end

    it "userが空では登録できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")    
    end

  end

   
end