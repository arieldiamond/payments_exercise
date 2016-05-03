class Loan < ActiveRecord::Base
	validates :funded_amount, 
		presence: true, 
		numericality: true
	
	has_many :payments, dependent: :destroy

	def calculate_balance
		balance = funded_amount - ( payments.map{ |m| m.amount }.sum )
		update(outstanding_balance: balance)
		outstanding_balance
	end

	def update_payment_and_balance(params)
		balance = calculate_balance
    payment = params[:payment].to_f
		if payment != 0.0 && balance + payment <= funded_amount
      payments << Payment.create(loan_id: id, amount: payment)
      update(outstanding_balance: balance - payment)
      self
    elsif payment != 0.0 && balance + payment > funded_amount
      { error: "Your payment has exceeded your balance of #{balance}. Please try again with a lower amount." }
    else
    	{ error: "Your entry is invalid. Please try this format: '/loans/id?payment=10.12'."}
    end
	end
end
