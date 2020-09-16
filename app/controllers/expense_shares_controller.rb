class ExpenseSharesController < ApplicationController
  def update
    @expense_share = ExpenseShare.find(params[:id])
    @expense = Expense.find(params[:expense_id])
    @expense_share.expense = @expense

    if @expense_share.update(expense_share_params)
      redirect_to home_expense_expense_share_path(@expense, @expense_share), notice: 'Bill was updated'
    end
  end

  private

  def expense_shares_params
    params.require(:expense_shares).permit(:paid) #amount or per amount
  end
end
