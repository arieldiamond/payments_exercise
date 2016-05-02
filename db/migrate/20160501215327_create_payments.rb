class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.integer :loan_id
    	t.decimal :amount
    	t.string :currency
    	t.string :date, :default => Date.today
    end
  end
end
