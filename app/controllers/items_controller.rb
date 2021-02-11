class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit]


  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_details, :category_id, :product_status_id, :shipping_charge_id,
                                 :prefecture_id, :days_to_ship_id, :selling_price).merge(user_id: current_user.id)
  end
end


def check_user
  @item = Item.find(params[:id])

  unless current_user.id == @item.user_id
      
    redirect_to action: :index

  end
end
