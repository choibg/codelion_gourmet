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
		@post = Post.new
		@post.category = params[:post_category]
		@post.title = params[:post_title]
		@post.content = params[:post_content]
		@post.like = 0
		if @post.save
			flash[:alert] = "다음을 저장하시겠습니까?"
			render :action => 'show' 
		else
			flash[:alert] = "제목을 반드시 입력하셔야 합니다."
			render :action => 'new'
		end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
