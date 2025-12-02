class FavoritesController < ApplicationController
  before_action :require_login
  before_action :set_task

  def create
    current_user.favorites.find_or_create_by(task: @task)
    redirect_to task_path(@task), notice: "いいねしました"
  end

  def destroy
    favorite = current_user.favorites.find_by(task: @task)
    favorite&.destroy
    redirect_to task_path(@task), notice: "いいねを取り消しました"
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end
end
