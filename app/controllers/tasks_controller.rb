class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  add_breadcrumb "Tasks", :tasks_path

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.tasks.paginate(page: params[:page])
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    add_breadcrumb "Task: " + @task.title
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.new
    add_breadcrumb "New Task"
  end

  # GET /tasks/1/edit
  def edit
    add_breadcrumb  "Editing Task: " + @task.title
  end

  def completed
    @tasks = current_user.tasks.where(is_done: true).paginate(page: params[:page])
    add_breadcrumb  "Completed Tasks "
  end

  def pending
    @tasks = current_user.tasks.where(is_done: false).paginate(page: params[:page])
    add_breadcrumb  "Completed Tasks "
  end

  def search

  end

  def by_category

  end

  def by_tags

  end

  def delete
    Task.destroy(params[:task_ids])
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.json { head :no_content }
    end
  end


  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.new(task_params)

      if @task.save
        redirect_to @task, notice: 'Task was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
      if @task.update(task_params)
        redirect_to @task, notice: 'Task was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.;
    def task_params
      params.require(:task).permit(:deadline_at, :title, :note, :is_done, :category_id, { tag_ids: [] })
    end
end
