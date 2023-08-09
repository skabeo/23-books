class DetailsController < ApplicationController
  before_action :authenticate_user!
  def index
    @category = Category.find(params[:category_id])
    @details = []
    @total_amount = 0
    @category.category_details.order(created_at: :desc).each do |category_detail|
      @details.push(category_detail.detail)
      @total_amount += category_detail.detail.amount
    end
  end

  def new
    @detail = Detail.new
  end

  def create
    @new_detail = current_user.details.new(detail_params)
    if @new_detail.save
      CategoryDetail.create(category_id: params[:category_id], detail_id: @new_detail.id)
      flash[:notice] = "#{@new_detail.name} transaction created"
      redirect_to category_details_path
    else
      flash[:alert] = 'Kindly fill all required fields'
      redirect_to new_category_detail_path(params[:category_id])
    end
  end

  private

  def detail_params
    params.require(:detail).permit(:name, :amount)
  end
end
