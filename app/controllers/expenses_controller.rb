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
    @expense.home = current_user.home
    @share_amount = @expense.amount / @home.user_ids.count
    # if choose someone number = ([] << user ).count

    if @expense.save
      @expense.home.users.each do |user|
        @expense.expense_share.create!(
        expense_id: Expense.find(@expense.id),
        user_id: user.id,
        paid: false,
        share_amount: @share_amount
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
