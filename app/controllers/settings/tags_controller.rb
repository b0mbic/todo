class Settings::TagsController < ApplicationController
  before_action :authenticate_user!, :set_tag, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Settings", :settings_path
  add_breadcrumb "Tags", :settings_tags_path

  # GET /tags
  # GET /tags.json
  def index
    @tags = current_user.tags.order('title ASC').paginate(page: params[:page])
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tasks_by_tag = @tag.tasks.paginate(page: params[:page])
    add_breadcrumb "Tag: " + @tag.title
  end

  # GET /tags/new
  def new
    @tag = current_user.tags.new
    add_breadcrumb "New Tag"
  end

  # GET /tags/1/edit
  def edit
    add_breadcrumb  "Editing Tag: " + @tag.title
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = current_user.tags.new(tag_params)

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
      @tag = current_user.tags.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:title, :color)
    end
end