Loan.create!(funded_amount: 100.0)
Loan.create!(funded_amount: 200.19)

Payment.create(amount: 10, loan_id: 1)
Payment.create(amount: 11.49, loan_id: 2)
