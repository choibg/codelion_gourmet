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
