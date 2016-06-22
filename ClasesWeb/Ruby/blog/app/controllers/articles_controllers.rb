class ArticlesController < ApplicationController
	
	#GET /articles
	def index
		Article.all
	end
end