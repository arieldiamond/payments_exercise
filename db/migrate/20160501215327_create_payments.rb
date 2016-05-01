class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.integer :amount
    	t.string :date
    	t.string :currency

      t.timestamps null: false
    end
  end
end
