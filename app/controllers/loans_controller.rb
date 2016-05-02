class LoansController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
  	Loan.all.each do |l|
  		if l.outstanding_balance == nil
  			l.update(outstanding_balance: l.funded_amount)
  		end
  	end
    render json: Loan.all
  end

  def show
    @loan = Loan.find(params[:id])
    if params[:payment] == nil
    	render json: @loan
    else
    	balance = @loan.calculate_balance
      render json: @loan.update_payment_and_balance(balance, params)
    end
  end
end
