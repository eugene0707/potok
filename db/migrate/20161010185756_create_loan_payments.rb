class CreateLoanPayments < ActiveRecord::Migration

  def change
    create_table :loan_payments, comment: 'Платежи по кредитам' do |t|
      t.references :loan, null: false
      t.decimal :amount, null: false, precision: 15, scale: 2, comment: 'Сумма платежа'
      t.integer :period, null: false, comment: 'Период платежа'
      t.boolean :is_overdue, null: false, default: false, comment: 'Флаг просроченного платежа'
      t.timestamps null: false
    end
  end

end
