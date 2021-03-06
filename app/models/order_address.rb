class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :order_id, :token

  with_options presence: true do
    validates :prefecture_id, :city, :house_number, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にはハイフン(-)が必要です"}
    validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "は---以外を選択してください" }

  def save
    # 購入履歴の情報を保存し、「order」という変数に入れている
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end

