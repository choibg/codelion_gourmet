# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = ["korean", "chinese", "japanese", "western"]

categories.each do |category|
	1.upto(3) do |post|
		p = Post.new
		p.user_id = 1
		p.category = category
		p.title = "제목"
		p.content = "소개글이 들어가는 부분"
		p.like = 0
		p.save
		puts p.title
	end
end
