class Payment < ActiveRecord::Base
	validates :amount, presence: true, numericality: true
	
	belongs_to :loan	
end
