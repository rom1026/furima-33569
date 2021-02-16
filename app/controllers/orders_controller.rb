class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :check_buy, only: [:index, :create]

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(user_order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: user_order_params[:token],
      currency: 'jpy'
    )
  end

  def check_buy
    redirect_to root_path if @item.order.present? || current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
