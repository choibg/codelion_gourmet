class FoodsController < ApplicationController
	before_action :session_check
	skip_before_action :session_check, :only => [:index, :index_category, :show]

  def index
		@posts = Post.all
  end

	def index_category
		@posts = Post.where(category: params[:category])
	end

  def new
  end

  def create
		post = Post.new
		post.user_id = session[:user_id]
		post.category = params[:post_category]
		post.title = params[:post_title]
		post.content = params[:post_content]
		post.like = 0
		if post.save
			flash[:alert] = "저장되었습니다."
			redirect_to "/foods/show/#{post.id}"
		else
			flash[:alert] = "제목을 반드시 입력하셔야 합니다."
			redirect_to "/foods/new"
		end
  end

  def show
		@post = Post.find(params[:id])
  end

  def edit
		@post = Post.find(params[:id])
  end

  def update
		post = Post.find(params[:id])
		post.category = params[:post_category]
		post.title = params[:post_title]
		post.content = params[:post_content]
		if post.save
			flash[:alert] = "저장되었습니다."
			redirect_to "/foods/show/#{post.id}"
		else
			flash[:alert] = "제목을 반드시 입력하셔야 합니다."
			redirect_to "/foods/update/#{post.id}"
		end
  end

  def destroy
		post = Post.find(params[:id])
		post.destroy
		flash[:alert] = "삭제되었습니다."
		redirect_to "/" 
  end

	def create_comment
		comment = Comment.new
		comment.post_id = params[:post_id]
		comment.content = params[:comment_content]
		comment.like = 0
		comment.save

		redirect_to "/foods/show/#{comment.post_id}"
	end

	def destroy_comment
		comment = Comment.find(params[:id])
		comment.destroy
		flash[:alert] = "댓글이 삭제되었습니다."
		redirect_to "/foods/show/#{comment.post_id}" 
	end
end
