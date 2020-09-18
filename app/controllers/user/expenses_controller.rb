class User::ExpensesController < ApplicationController
  def index
    @expenses = current_user.expenses
    @home = current_user.home
  end
end
