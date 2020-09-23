class ExpensesController < ApplicationController
  def index
    @home = Home.find {|home| current_user.home == home }
    @expenses = @home.expenses.all.order(:created_at)
    # @expense = Expense.find_by(user: current_user, home: @home)
    @expense_share = ExpenseShare.find_by(user: current_user, expense: @expense)
  end

  def show
    @home = Home.find {|home| current_user.home == home }
    @expense = Expense.find(params[:id])
    @expense_share = ExpenseShare.find_by(user: current_user, expense: @expense)
  end

  def new
    @home = Home.find(params[:home_id])
    @expense = Expense.new
    @expense.home = @home

    # @homies = []

    # @home.users.each do |homie|
    #   @homies << homie.first_name
    # end

    # @expense = Expense.new(:expense_shares)
  end

  def create
    @expense = Expense.new(expense_params)
    @home = Home.find(params[:home_id])
    @expense.user_id = current_user.id
    @expense.home = current_user.home
    homies_expense_shares = User.where(id: params[:expense][:expense_share_ids])
    share_amount = @expense.amount / homies_expense_shares.count
    # TODO: can choose homies = ([] << user ).count



    if @expense.save
      homies_expense_shares.each do |user|
        @expense.expense_shares.create!(
        expense_id: Expense.find(@expense.id),
        user_id: user.id,
        paid: false,
        share_amount: share_amount
        )
      end
      redirect_to home_expenses_path
    else
      render :new
    end
  end

  def paid
    @home = current_user.home
     @expense_share = ExpenseShare.find(params[:id])
    # @expense_share.expense = @expense
    @expense_share.paid = !@expense_share.paid
    @expense_share.save!
    redirect_to home_expenses_path(@expense_share)
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :due_on, :description)
  end
end
