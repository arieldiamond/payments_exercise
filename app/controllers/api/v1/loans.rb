module API
  module V1
    class Loans < Grape::API
      include API::V1::Defaults
      version 'v1', using: :path

      resource :loans do
        desc 'Return loans baseds on params'
        get '/' do
          @loans = Loan.all
        end

        desc 'Return a Loan'
        params do
          requires :id, type: String
          optional :payment, type: String
          optional :currency, type: String
        end

        get ':id', root: 'loan' do
          @loan = Loan.find_by(id: params[:id])
          return @loan if params[:payment] == nil
          balance = @loan.calculate_balance
          @loan.update_payment_and_balance(balance, params)
        end

        # Display all payments for loan
        segment '/:loan_id' do
          get '/payments' do
            @loan = Loan.find_by(id: params[:loan_id])
            @loan.payments
          end
        end

        # Display payment for loan by id
        segment '/:loan_id' do
          resource '/payments' do
            get '/:id' do
              @loan = Loan.find_by(id: params[:loan_id])
              @payment = @loan.payments.find_by(id: params[:id])
            end
          end
        end
      end
    end
  end
end