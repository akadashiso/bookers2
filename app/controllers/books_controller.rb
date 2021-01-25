class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.book_id = current_book.id
    @book.save
    redirect_to book_path(book)
  end

  def index
    @users = User.all
  end
  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

end
