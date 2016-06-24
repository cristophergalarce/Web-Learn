class ArticlesController < ApplicationController
	
	#GET /articles
	def index
		# Obtiene todos los articles
		@articles = Article.all
	end

	#GET /articles/:id
	def show
		# Encuentra un article por id
		@article = Article.find(params[:id])
	end

	#GET /articles/new
	def new
		@article = Article.new
	end

	#POST /articles
	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render :new
		end
	end

	def update
		# @article.update_attributes({title: 'Nuevo titulo'})
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit				
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy #Elimina el obj de la db
		redirect_to articles_path
	end

	private

	def article_params
		params.require(:article).permit(:title, :body)
	end
end