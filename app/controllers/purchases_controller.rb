class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id != @item.user.id
    else
      redirect_to root_path
    end
  end
  def create
    @buyer = Buyer.new(buyer_params)
    if @buyer.valid?
      @buyer.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buyer_params
    params.permit(:user_id, :item_id, :postal_code, :city, :house_number, :tell, :building_name, :prefecture_id)
  end
end
