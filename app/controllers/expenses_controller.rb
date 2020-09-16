class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @home = Home.find(params[:home_id])
    @expense = Expense.find_by(user: current_user, home: @home)
    @expense_share = ExpenseShare.find_by(user: current_user, expense: @expense)
  end

  def show
    @expense = Expense.find(params[:id])
    @expense_share = ExpenseShare.find_by(user: current_user, expense: @expense)
  end

  def new
    @home = Home.find(params[:home_id])
    @expense = Expense.new
    @expense.home = @home
  end

  def create
    @expense = Expense.new(expense_params)
    @home = Home.find(params[:home_id])
    @expense.user_id = current_user.id
    @expense.home = current_user.home
    @par_amount = @expense.amount / @home.user_ids.count
    # if choose someone number = ([] << user ).count

    if @expense.save
      @expense.home.users.each do |user| 
        @expense.expense_shares.create!(
        expense_id: Expense.find(@expense.id),
        user_id: user.id,
        paid: false,
        share_amount: @par_amount 
        )
      end
      redirect_to home_expenses_path(@home, @expense)
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :due_on, :description)
  end
end
