require 'rails_helper'

RSpec.describe Loan, type: :model do
	loan = Loan.create!(funded_amount: 200.19)

  # Associations
	it "has many Payments" do
    l = Loan.reflect_on_association(:payments)
    expect(l.macro).to eq(:has_many)
  end
end  