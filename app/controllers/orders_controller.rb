class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_id, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)  
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
        @item = Item.find(params[:item_id])
        render action: :index
    end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def order_address_params
   params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end  
end
