class UsersController < ApplicationController
  before_action :get_user, only: [:show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge(type: UserType.anything_but_admin))
    if @user.save
      session[:user_id] == @user.id
      redirect_to @user
    else
      render 'new'
    end
  end
  private
    def user_params
      params.require(:user).permit(:username, :password)
    end

    def get_user
      authenticate!
      @user = current_user
    end
end
