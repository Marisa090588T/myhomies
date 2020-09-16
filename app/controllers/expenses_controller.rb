class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
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
    # @expense.user_id = current_user
    @expense.home = current_user.home
    @par_amount = @expense.amount / @expense.home.users.count

    if @expense.save
      @expense.home.users.each do |user| #hes many users
        @expense.expense_share.create!(
        expense_id: Expense.find(@expense.id),
        user_id: user.id,
        paid: false,
        amount: @par_amount #no amount yet
        )
      end
      redirect_to home_expense_path(@expense.home, @expense)
    else
      render :new
    end
  end

  private

  def expenses_params
    params.require(:expense).permit(:name, :amount, :due_on, :description)
  end
end
