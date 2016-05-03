Loan.create!(funded_amount: 100.0)
Loan.create!(funded_amount: 200.19)

Payment.create(amount: 10, loan_id: 1)
Payment.create(amount: 11.49, loan_id: 2)

Loan.all.each do |l|
	l.update(outstanding_balance: l.calculate_balance)
end
