class BooksController < ApplicationController
  def index
    @book_temprate = Book.new
    @books = Book.all
  end

  def create
    @book_temprate = Book.new(book_temprate_params)
    @book_temprate.user_id = current_user.id
    if @book_temprate.save
     flash[:notice] = "New post successfully"
    redirect_to book_path(@book_temprate.id)
    else
      @books=Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user_temprate = @book.user
    @book_temprate = Book.new

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book= Book.find(params[:id])
  end
  def update
    @book= Book.find(params[:id])
   if @book.update(book_temprate_params)
     redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
   else
     @books=Book.all
     render :edit
   end
  end


  private

  def book_temprate_params
    params.require(:book).permit(:title,:body)
  end
end
