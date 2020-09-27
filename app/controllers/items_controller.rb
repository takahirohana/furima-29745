class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.includes(:user).order("created_at DESC")
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
    params.require(:item).permit(:image, :product_name, :category_id, :price, :product_status_id, :delivery_fee_id, :shipment_source_id, :shipping_day_id, :product_text).merge(user_id: current_user.id)
  end
end
