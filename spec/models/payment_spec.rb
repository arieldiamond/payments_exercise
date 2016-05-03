require 'rails_helper'

RSpec.describe Payment, type: :model do
	let(:payment) {Payment.create!(amount: 10, loan_id: 1)}

  # Validations
  it { expect(payment).to validate_presence_of(:amount) }
  it { expect(payment).to validate_numericality_of(:amount) }

  # Associations
  it "belongs to Loan" do
    p = Payment.reflect_on_association(:loan)
    expect(p.macro).to eq(:belongs_to)
  end
end
