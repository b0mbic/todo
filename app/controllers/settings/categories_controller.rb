class Settings::CategoriesController < ApplicationController
  before_action :authenticate_user!, :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = current_user.categories.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = current_user.categories.new
  end

  # GET /categories/1/edit
  def edit
  end


  def create
    @category = current_user.categories.new(category_params)
      if @category.save
        redirect_to [:settings, @category], notice: 'Category was successfully created.'
      else
        render :new
      end
    end

  def update
      if @category.update(category_params)
        redirect_to [:settings, @category], notice: 'Category was successfully updated.'
      else
        render :edit
      end
  end


  def destroy
    @category.destroy
      redirect_to settings_categories_path, notice: 'Category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:title, :color, :user_id)
    end
end
