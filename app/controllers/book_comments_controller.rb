class BookCommentsController < ApplicationController

  def create
    @book=Book.find(params[:book_id])
    @user=@book.user
    @comment=BookComment.new
    comment=current_user.book_comments.new(comment_params)
    comment.book_id=@book.id
    comment.save
    @comments=@book.book_comments
    render 'book_comments/post_comments'
  end

  def destroy
    @book=Book.find(params[:book_id])
    @user=@book.user
    @comment=BookComment.new
    @comments=@book.book_comments
    BookComment.find(params[:id]).destroy
    render 'book_comments/post_comments'
  end

private

def comment_params
  params.require(:book_comment).permit(:comment)
end
end
