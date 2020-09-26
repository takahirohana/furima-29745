class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.includes(:user)
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save #バリデーションをクリアした時
      redirect_to root_path
    else
      render "new" #バリデーションで弾かれたとき
    end
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :sller, :category, :price, :product_status, :delivery_fee, :shipment_source, :shipping_days, :product_text).merge(user_id: current_user.id)
  end
end
