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
          requires :id, type: String, desc: 'ID of the Loan'
        end

        get ':id', root: 'loan' do
          @loan = Loan.find_by(id: params[:id])
          if params[:payment] != nil 
            payment = params[:payment].to_i
            
            if payment.is_a? Integer
              sum = @loan.payments.map{|m| m[:payment_usd]}.sum
              if sum + payment <= @loan.funded_amount
                @loan.payments << { payment_usd: payment, date: Date.today }
                @loan.save
                { outstanding_amount: @loan.funded_amount - (sum + payment), loan: @loan }
              else
                { error: "Your payment has exceeded your balance. Please try again with a lower amount.", loan: @loan }
              end
            end

          end
          # @loan
        end

      end

    end
  end
end