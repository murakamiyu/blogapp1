class CommentsController < ApplicationController
  def create
      @comment = Comment.create(rate: comment_params[:rate], text: comment_params[:text], blog_id: comment_params[:blog_id], user_id: current_user.id)
  	  respond_to do |format|
  	  	format.html { redirect_to blog_path(params[:blog_id])}
  	  	format.json
      end
  end

  private
  def comment_params
    params.permit(:text, :blog_id, :rate)
  end
end
