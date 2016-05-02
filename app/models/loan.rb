class Loan < ActiveRecord::Base
	validates :funded_amount, presence: true, numericality: true
	# validates :outstanding_balance, numericality: true
	
	has_many :payments
end
