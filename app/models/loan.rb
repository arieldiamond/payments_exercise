class Loan < ActiveRecord::Base
	validates :funded_amount, presence: true
	
	serialize :payments, Array
	has_many :payments
end
