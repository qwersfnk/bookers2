class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  # 以下を追加

  def top
    @book_image = BookImage.new
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      @user= current_user
     render :index
    end
  end

  def index
    @users= User.all
    @book= Book.new
    @user= current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)
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