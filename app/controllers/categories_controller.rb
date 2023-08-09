class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = current_user.categories.order(created_at: :desc).all
    @total_amount = []

    @categories.each do |category|
      total = 0
      category.category_details.each do |category_detail|
        total += category_detail.detail.amount
      end
      @total_amount.push(total)
    end
  end

  def new
    @category = Category.new
  end

  def create
    @new_category = current_user.categories.new(category_params)
    if @new_category.save
      flash[:notice] = "#{@new_category.name} created successfully"
      redirect_to categories_path
    else
      flash[:alert] = 'Fill all required fields'
      redirect_to new_category_path
    end
  end

  private

  def category_params
    params.required(:category).permit(:name, :icon)
  end
end
