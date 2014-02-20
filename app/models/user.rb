class User < ActiveRecord::Base
	has_many	:comments
	has_many	:posts
	validates :username, :presence => { :message => "Username cannot be blank." }
	validates :username, :uniqueness => { :message => "Username is already taken.", :case_sensitive => false }
	validates :password, :length => { :minimum => 6, :too_short => "Your password must be at least 6 characters long." }
end
