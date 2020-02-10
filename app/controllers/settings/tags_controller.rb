class Settings::TagsController < ApplicationController
  before_action :authenticate_user!, :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)
    @tag.user = current_user

      if @tag.save
        redirect_to [:settings, @tag], notice: 'Tag was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
      if @tag.update(tag_params)
        redirect_to [:settings, @tag], notice: 'Tag was successfully updated.'
      else
         render :edit
      end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    redirect_to settings_tags_path, notice: 'Tag was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:title, :color, :user_id)
    end
end