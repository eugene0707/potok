class CreateLoans < ActiveRecord::Migration

  def change
    create_table :loans, comment: 'Выданные кредиты' do |t|
      t.references :user, null: false, comment: 'Получатель займа'
      t.references :investment, null: false, comment: 'Источник финансирования'
      t.integer :amount, null: false, comment: 'Сумма займа'
      t.integer :term, null: false, comment: 'Срок займа'
      t.decimal :interest_rate, precision: 5, scale: 4, default: 0.5, null: false, comment: 'Ставка по кредиту'
      t.decimal :penalty_rate, precision: 5, scale: 4, default: 0.5, null: false, comment: 'Штраф за задержку платежа'
      t.timestamps null: false
    end
  end

end
