class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user == @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      @error_message = "invalid username/password combo"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
