class AddAmountToExpenseShares < ActiveRecord::Migration[6.0]
  def change
    add_column :expense_shares, :share_amount, :float
  end
end
