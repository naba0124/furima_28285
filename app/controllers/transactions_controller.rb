class TransactionsController < ApplicationController
  before_action :move_to_index, expect: [:index]
  before_action :move_to_index_a, expect: [:index]
  before_action :find_item, only: [:create, :index]

  def index
    if @item.item_order != nil
      redirect_to root_path
    end
  end

  def new
    @transaction = TransactionAddress.new
  end

  def create
    @transaction = TransactionAddress.new(address_params)
    if @transaction.valid?
      pay_item
      ItemOrder.create(item_id: params[:item_id])
      @transaction.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def transaction_params
    params.permit(:token).merge(user_id: current_user.id, item_id: @item.id)
  end

  def address_params
    params.permit(:post_number, :address_origin_id, :city, :address, :build_number, :tel, :item_id).merge(user_id: current_user.id)
  end

  def move_to_index
      redirect_to user_session_path unless user_signed_in? 
  end

  def move_to_index_a
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: transaction_params[:token],
      currency: 'jpy'
      )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

end

