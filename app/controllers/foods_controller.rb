class FoodsController < ApplicationController
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
end
