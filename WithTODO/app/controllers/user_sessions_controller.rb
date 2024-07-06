class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @skip_header_footer = true
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to tasks_path
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other #あとでさよなら画面に変える
  end
end