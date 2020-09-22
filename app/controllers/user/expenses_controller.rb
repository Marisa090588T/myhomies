class User::ExpensesController < ApplicationController
  def index
    @home = current_user.home
    @expenses = @home.expenses.all.order(:created_at)
    @user = current_user
    @expense = Expense.find_by(user: current_user, home: @home)
    @expense_share = ExpenseShare.find_by(user: @user, expense: @expense)
  end
end
