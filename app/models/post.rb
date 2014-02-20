class Post < ActiveRecord::Base
	belongs_to	:post
	validates :title, :presence => { :message => "Title cannot be blank." }
end
