# Payments Exercise

x Add in the ability to create payments for a given loan using a JSON API call. 

x You should store the payment date and amount. 

x Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`. 

x The outstanding balance should be calculated as the `funded_amount` minus all of the payment amounts.

x A payment should not be able to be created that exceeds the outstanding balance of a loan. 

x You should return validation errors if a payment can not be created. Expose endpoints for seeing all payments for a given loan as well as seeing an individual payment.