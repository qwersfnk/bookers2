class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  # 以下を追加

  def top
    @book_image = BookImage.new
  end

  def index
    @books= Book.all
    @book= Book.new
    @user= current_user
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user= current_user
      @books= Book.all
     render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
    #book.update(book_params)
    #redirect_to book_path(book.id)
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end