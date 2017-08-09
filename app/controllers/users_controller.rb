class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge(type: UserType.anything_but_admin))
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
