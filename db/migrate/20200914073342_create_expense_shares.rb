class CreateExpenseShares < ActiveRecord::Migration[6.0]
  def change
    create_table :expense_shares do |t|
      t.boolean :paid
      t.references :expense, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
