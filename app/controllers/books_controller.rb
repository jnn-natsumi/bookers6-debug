class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_book, only: [:edit, :update]

  def show
    # @bbook = Book.new
  	@book = Book.find(params[:id])
    @booknew = Book.new
    @user = User.find_by(id: @book.user_id)
    @book_comment = BookComment.new
    # 追加
    @book_comments = @book.book_comments
  end

  def index
    # 追加　0511
    @user = current_user
    @book = Book.new
    # @fbook = Book.find(params[:id])
  	@books = Book.all
    #一覧表示するためにBookモデルの情報を全てくださいのall
  end

  def create
    @user = current_user
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
     #Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
  	if @book.save #入力されたデータをdbに保存する。
  		redirect_to book_path(@book), notice: "successfully created book!"#保存された場合の移動先を指定。
  	else
  		@books = Book.all
  		render :index
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		redirect_to book_path(@book.id), notice: "successfully updated book!"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
  		render action: :edit
  	end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "successfully delete book!"
  end

  # def delete
  # 	@book = Book.find(params[:id])
  # 	@book.destoy
  # 	redirect_to books_path, notice: "successfully delete book!"
  # end

  def correct_book
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
