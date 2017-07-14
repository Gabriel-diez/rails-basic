class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: :destroy

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @post
  end

  def destroy
    @comment.destroy
    redirect_to @post
  end

  private

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
