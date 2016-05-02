class Loan < ActiveRecord::Base
	validates :funded_amount, presence: true, numericality: true
	
	has_many :payments

	def calculate_balance
		balance = funded_amount - (payments.map{ |m| m.amount }.sum)
		update(outstanding_balance: balance)
		outstanding_balance
	end

	def update_payment_and_balance(balance, payment, currency)
    payment = payment.to_f
		if payment != nil 
			if payment.is_a? Float
	      if balance + payment <= funded_amount
	        Payment.create(loan_id: id, amount: payment, currency: currency  || 'USD' )
	        update(outstanding_balance: funded_amount - (balance + payment))
	        self
	      else
	        { error: "Your payment has exceeded your balance. Please try again with a lower amount.", loan: self }
	      end
	    end
	  end
	end
end
