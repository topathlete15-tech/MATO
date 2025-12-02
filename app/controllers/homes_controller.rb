class HomesController < ApplicationController
  def top
    # ログイン済みユーザーはタスク一覧ページへリダイレクト
    redirect_to tasks_path and return if logged_in?
  end
end
