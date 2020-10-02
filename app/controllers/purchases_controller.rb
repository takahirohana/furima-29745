class PurchasesController < ApplicationController
  def index
    @buyer = Buyer.new
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id != @item.user.id
    else
      redirect_to root_path
    end
  end
  def create
    @item = Item.find(params[:item_id])
    @buyer = Buyer.new(buyer_params)
    if @buyer.valid?
      pay_item
      @buyer.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buyer_params
    params.require(:buyer).permit(:postal_code, :city, :house_number, :tell, :building_name, :prefecture_id).merge(user_id: current_user.id,token: params[:token],item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end
end