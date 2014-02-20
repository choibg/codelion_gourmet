class FoodsController < ApplicationController
  def home
  end

  def index
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
