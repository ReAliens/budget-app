class PaymentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource except: :create

  def index
    @payments = current_user.payments.order('created_at DESC')
  end

  def show
    @payment = payment.find(params[:id])
  end

  def new
    @payment = Payment.new
    @categories = current_user.categories
  end

  def create
    @payment = current_user.payments.new(payments_params)
    @category = Category.find(payments_params['category_id'])

    respond_to do |format|
      if @payment.save
        format.html { redirect_to category_path(@category), notice: 'Payment added successfully' }
      else
        format.html { render :new, notice: 'something went wrong, please try again' }
      end
    end
  end

  private

  def payments_params
    params.require(:payment).permit(:name, :amount, :category_id)
  end
end
