# class ExpenseSharesController < ApplicationController
#   def update
#     @expense_share = ExpenseShare.find(params[:id])
#     @expense = Expense.find(params[:expense_id])
#     @expense_share.expense = @expense

#     if @expense_share.update(expense_share_params)
#       redirect_to home_expense_path(@home, @expense), notice: 'Bill status was updated.'
#     end
#   end

#   def index
#     @home = Home.find(params[:home_id])
#     @expense_shares = current_user.expense_shares
#   end

#   def show
#     @home = Home.find(params[:home_id])
#     @expense = Expense.find(params[:id])
#     @expense_share = ExpenseShare.find_by(user: current_user, expense: @expense)
#   end

#   def paid
#     @expense_share = ExpenseShare.find(params[:id])
#     @expense = Expense.find(params[:expense_id])
#     @expense_share.expense = @expense
#     @expense_share.paid = true
#     @expense_share.save
#     redirect_to dashboard_path
#   end

#   private

#   def expense_shares_params
#     params.require(:expense_shares).permit(:paid) 
#   end
# end