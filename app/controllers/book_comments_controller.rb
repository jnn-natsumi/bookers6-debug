class BookCommentsController < ApplicationController
	before_action :correct_user, only: [:destroy]

	def create
		@book = Book.find(params[:book_id])
		book_comment = current_user.book_comments.new(book_comment_params)
		book_comment.book_id = @book.id
		# if
	    book_comment.save
		   # redirect_to book_path(@book), notice: "successfully created comment!"
	    # else
	    #    @booknew = Book.new
	    #    @user = User.find_by(id: @book.user_id)
	    #    @book_comments = @book.book_comments
	       # render "books/show"
	end

	def destroy
		@book = Book.find(params[:book_id])
		book_comment = BookComment.find(params[:id])
		book_comment.destroy
		# redirect_to book_path(@book)
	end

	# 削除できるのは自分のコメントのみ
	def correct_user
		@book_comment = current_user.book_comments.find_by(id: params[:id])
		unless @book_comment
			redirect_to books_path(@book)
		end
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment, :book_id, :user_id)
	end
end
