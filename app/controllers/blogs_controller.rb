class BlogsController < ApplicationController

	before_action :move_to_index, except: [:index, :show]

	  def index
		 @blogs = Blog.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    end

    def new
    end

    def create
       Blog.create(name: blog_params[:name], image: blog_params[:image], text: blog_params[:text], user_id: current_user.id)
    end

    def destroy
      blog = Blog.find(params[:id])
      if blog.user_id == current_user.id
        blog.destroy
      end
    end

    def edit
      @blog = Blog.find(params[:id])
    end

    def update
      blog = Blog.find(params[:id])
      if blog.user_id == current_user.id
        blog.update(blog_params)
      end
    end

    def show
	    @blog = Blog.find(params[:id])
	    @comments = @blog.comments.includes(:user)
    end

    private
    def blog_params
      params.permit(:name, :image, :text)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

end
