class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end
  def new
    @item = Itme.new
  end
  def create
    Item.create(itme_params)
  end
  def show
  end
  def edit
  end

  private

  def iteme_params
    params.require(:item).permit(:image, :product_name, :sller, :category, :price, :product_status, :delivery_fee, :shipment_source, :shipping_days, :product_text).merge(user_id: current_user.id)
end
