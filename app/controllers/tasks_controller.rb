class TasksController < AuthController

  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: "追加しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "削除しました"
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :category_id, :deadline_on, :importance)
  end

end
