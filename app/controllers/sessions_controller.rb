class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user = @user.authenticate(params[:password])
      session[:user_id] = @user.id
    else
      render 'new'
    end
  end

  def destroy

  end
end
