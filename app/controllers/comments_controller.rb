class CommentsController < ApplicationController
  def create
      @comment = Comment.create(rate: comment_params[:rate], text: comment_params[:text], blog_id: comment_params[:blog_id], user_id: current_user.id)
  	  redirect_to "/blogs/#{@comment.blog.id}"
  end

  private
  def comment_params
    params.permit(:text, :blog_id, :rate)
  end
end
