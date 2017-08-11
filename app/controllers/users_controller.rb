class UsersController < ApplicationController
  before_action :authenticate!, only: [:show]
  before_action :get_user, only: [:show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge(type: UserType.find_or_create_by(name: "contributor")))
    if @user.save
      session[:user_id] = @user.id
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
      @user = User.find(params[:id])
    end
end
