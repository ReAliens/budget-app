class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource except: :create

  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(categories_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'category added successfully' }
      else
        format.html { render :new, notice: 'something went wrong, please try again' }
      end
    end
  end

  def show
    @category = Category.includes(:payments).order('created_at DESC').find(params[:id])
  end

  private

  def categories_params
    params.require(:category).permit(:name, :icon)
  end
end
