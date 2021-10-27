class CategoriesController < ApplicationController
  before_action :require_admin, only: [:create]

  def new
    @category = Category.new
  end

  def create
      @category = Category.new(category_params)
      if @category.save
          flash[:notice] = t 'flash.category.success'
          redirect_to @category
      else
          render 'new'
      end
  end

  def show
    begin
      @category = Category.find(params[:id])
    rescue
      flash[:notice] = t 'flash.category.notfound'
      redirect_to root_url
    end
    @foods = @category.foods
  end

  def index
    @categories = Category.all.order(name: :asc)
  end

  private

  def category_params
      params.require(:category).permit(:name)
  end
end
