class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(books_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to "/books/#{@book.id}"
    else
      # renderはアクションを経由しないので、再定義
      @books = Book.all
      render :index
    end
  end

  def edit
   @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to "/books/#{@book.id}"
    else
      # 失敗したら、リダイレクト
      render :edit
    end
  end
  
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end
  
  private
  def books_params
    params.require(:book).permit(:title,:body)
  end
  
end
