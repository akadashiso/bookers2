class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
    # @user = @book.user
  end

  def show
    @book = Book.find(params[:id])
    @book2 = Book.new
    @books = Book.all
    @user = @book.user
    # @user = User.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to books_path
    end
  end

  def update
  # @user = current_user
  @book = Book.find(params[:id])
  # binding.pry

  if @book.update(book_params)
    flash[:notice] = "successfully"
    redirect_to book_path(@book)
  else
    render :edit
  end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
