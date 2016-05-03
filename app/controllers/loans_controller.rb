class LoansController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: 'Loan not found' }, status: :not_found
  end

  def index
    render json: Loan.all
  end

  def show
    @loan = Loan.find(params[:id])
    if params[:payment] == nil
    	render json: @loan
    else
      render json: @loan.update_payment_and_balance(params)
    end
  end
end
