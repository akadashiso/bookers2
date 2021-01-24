class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path(@user.id)
  end

# ここがuserかusersか不明
  def index
    @users = User.all
  end

  def show
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
