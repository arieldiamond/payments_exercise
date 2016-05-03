require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  describe '#index' do
    it 'responds with a 200' do
      get :index, loan_id: 1
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    let(:payment) { Payment.create!(loan_id: 1, amount: 10.0) }

    it 'responds with a 200' do
      get :show, {loan_id: 1, id: payment.id}
      expect(response).to have_http_status(:ok)
    end

    context 'if the payment is not found' do
      it 'responds with a 404' do
        get :show, {loan_id: 1, id: 10000}
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
