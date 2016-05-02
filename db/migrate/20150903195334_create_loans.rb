class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.decimal :funded_amount, precision: 8, scale: 2
      t.decimal	:outstanding_balance

      t.timestamps null: false
    end
  end
end
