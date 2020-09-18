class AddPaidToExpenses < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :paid, :boolean, :default => false
  end
end
