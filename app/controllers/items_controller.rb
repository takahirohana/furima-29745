class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move,only: [:edit, :update]
  def index
    @items = Item.all.order("created_at DESC")
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

  def update
    @item.update(item_params)
      if current_user.id == @item.user_id
      redirect_to root_path
      else
      render :edit
      end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :category_id, :price, :product_status_id, :delivery_fee_id, :shipment_source_id, :shipping_day_id, :product_text).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move 
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end
end
