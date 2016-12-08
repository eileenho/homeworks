class SessionsController < ApplicationController
  before_action :current_user_redirect

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      session_params[:username],
      session_params[:password]
    )

    log_in(user)

    redirect_to cats_url
  end

  def destroy
    #current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to cats_url
  end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end

  def current_user_redirect
    redirect_to cats_url unless @current_user.nil?
  end
end
