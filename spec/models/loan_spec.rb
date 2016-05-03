require 'rails_helper'

RSpec.describe Payment, type: :model do
	let(:loan) {Loan.create!(funded_amount: 200.19)}

  # Validations
  it { expect(loan).to validate_presence_of(:funded_amount) }
  it { expect(loan).to validate_numericality_of(:funded_amount) }

  # Associations
	it "has many Payments" do
    l = Loan.reflect_on_association(:payments)
    expect(l.macro).to eq(:has_many)
  end
end  