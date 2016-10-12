class CreateInvestments < ActiveRecord::Migration

  def change
    create_table :investments, comment: 'Инвестиционные пакеты' do |t|
      t.references :user, null: false, comment: 'Инвестор'
      t.string :name, null: false
      t.integer :term, null: false, comment: 'Срок инвестиций'
      t.decimal :interest_rate, precision: 5, scale: 4, default: 0.5, null: false, comment: 'Ожидаемый доход'
      t.timestamps null: false
    end
  end

end
