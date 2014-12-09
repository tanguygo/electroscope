class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update]

    def new
      @order = Order.new
      @user = User.new
    end

    def create
      @order = Order.new(order_params)
      @user = User.new(user_params)
      if @user.save
        @order.user=@user
        @order.status = "ordered_no_payment"
        @order.creation_date = Time.now
        if @order.save
          sign_in(@user)
          redirect_to root_path
        else
          render :new, alert: @order.errors.full_messages.join('<br/>')
        end
      else
        render :new, alert: @user.errors.full_messages.join('<br/>')
      end

    end

    def show
    end

    def edit
    end

    def update

    end

    private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:counter_type,:delivery_option,:offer_id,:street_number,\
        :route, :locality,:administrative_area_level_1,:postal_code,:country)
    end
    def user_params
      params.require(:order).require(:user).permit(:email,:last_name,:first_name,:birthday,:civility,:password)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

end
