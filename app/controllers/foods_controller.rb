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
		p = Post.new
		p.category = params[:post_category]
		p.title = params[:post_title]
		p.content = params[:post_content]
		p.like = 0
		if p.save
			redirect_to "/"
		else
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
