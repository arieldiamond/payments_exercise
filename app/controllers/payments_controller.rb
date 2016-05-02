class PaymentsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    render json: Payment.all
  end

  def show
    render json: Payment.find(params[:id])
  end
end
/Users/arieldiamond/Desktop/payments_exercise/app/controllers/concerns/payments_controller.rb