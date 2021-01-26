class UsersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    flash[:notice]
    redirect_to user_path(@user.id)
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    # @user = @book.user
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
    # @user = @book.user
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    # binding.pry
    if @user.update(user_params)
      flash[:notice]= "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit


    end
  end

  def destroy
    flash[:notice]
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
