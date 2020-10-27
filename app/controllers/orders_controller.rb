class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_address_params)  
     if @order_address.valid?
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
   params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
