class BookCommentsController < ApplicationController
  def create
    p book = Book.find(params[:book_id])
    p comment = current_user.book_comments.new(book_comment_params)
    p comment.book_id = book.id
    p comment.save!
    redirect_to request.referer
    # redirect_to book_path(book)
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to request.referer
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
