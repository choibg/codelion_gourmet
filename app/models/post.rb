class Post < ActiveRecord::Base
	belongs_to	:user
	has_many :comments
	validates :title, :presence => { :message => "Title cannot be blank." }
end
