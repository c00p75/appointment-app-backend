class MotorcyclesController < ApplicationController
  load_and_authorize_resource

  def index
    @motorcycles = Motorcycle.all
    render json: @motorcycles
  end

  def user_motorcycles
    @user_motorcycles = current_user.motorcycles
    render json: @user_motorcycles
  end

  def show
    render json: @motorcycle
  end

  def create
    @motorcycle = @current_user.motorcycles.build(motorcycle_params)
    if @motorcycle.save
      render json: @motorcycle, status: :created
    else
      render json: { errors: @motorcycle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @motorcycle.destroy
      render json: { message: 'Motorcycle deleted successfully' }
    else
      render json: { message: 'You are not authorized to delete the item' }, status: :unauthorized
    end
  end

  private

  def set_motorcycle
    @motorcycle = Motorcycle.find(params[:id])
  end

  def motorcycle_params
    params.require(:motorcycle).permit(:model, :description, :photo, :duration, :finance_fee, :purchase_fee,
                                       :amount_payable, :user_id)
  end
end
