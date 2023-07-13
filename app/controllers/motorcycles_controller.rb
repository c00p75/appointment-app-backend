class MotorcyclesController < ApplicationController
  before_action :set_motorcycle, only: [:show, :delete]

  def index
    @motorcycles = Motorcycle.all
    render json: @motorcycles
  end

  def show
    render json: @motorcycle
  end

  def create
    @motorcycle = Motorcycle.new(motorcycle_params)
    if @motorcycle.save
      render json: @motorcycle, status: :created
    else
      render json: { errors: @motorcycle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def delete
    @motorcycle.destroy
    render json: { message: 'Motorcycle deleted successfully' }
  end

  private

  def set_motorcycle
    @motorcycle = Motorcycle.find(params[:id])
  end

  def motorcycle_params
    params.require(:motorcycle).permit(:model, :description, :photo, :duration, :finance_fee, :purchase_fee, :amount_payable, :user_id)
  end
end
