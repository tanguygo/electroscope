class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new,:create]

  before_action :set_order, only: [:show, :edit, :update]

#pour l'utilisateur qui commande en n'ayant pas encore de compte
#génération simultanée de l'user et de l'order, ainsi que d'un appartement par défaut
    def new
      @order = Order.new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.valid?
        @order = @user.orders.new(order_params)
        if @order.save  #sauve l'utilisateur au passage
          @order.set_initial_values
          @user.flats.create(flat_params).set_initial_values
          sign_in(@user)
          @user.send_welcome_email
          redirect_to edit_flat_path(current_user.flat)
        else
          render :new, alert: @order.errors.full_messages.join('-')
        end
      else
        render :new, alert: @user.errors.full_messages.join('-')
      end
    end

#pour l'utilisateur qui commande un boitier en ayant déjà un compte
#génération de l'order uniquement
    def new_authenticated
    end

    def create_authenticated
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

    def set_user
      @user = User.find(params[:user_id])
    end

    def order_params
      params.require(:order).permit(:counter_type,:delivery_option,:offer_id,:street_number,\
        :route, :locality,:administrative_area_level_1,:postal_code,:country)
    end

    def user_params
      params.require(:order).require(:user).permit(:email,:last_name,:first_name,:birthday,:civility,:password)
    end

    def flat_params
       params.require(:order).permit(:street_number,\
        :route, :locality,:administrative_area_level_1,:postal_code,:country)
    end
end
