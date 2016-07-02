class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	before_action :set_article, except: [:index, :new, :create]
	
	# GET /articles (#index)
	def index
		# Obtiene todos los articles
		@articles = Article.all
	end
	#GET /articles/:id
	def show
		# Encuentra un article por id
		@article = Article.find(params[:id])
		@comment = Comment.new
	end

	#GET /articles/new
	def new
		@article = Article.new
	end
	#POST /articles
	def create
		# @article = Article.new(title: params[:article][:title],
							#	body: params[:article][:body])
		# fix @article = current_user.articles.new(article_params)

		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render :new #no renderiza el metodo, sino la vista
		end

		#la condicion dice que si el articulo ha sido guardado,luego de validarse
		#redirige a la vista del article creado y guardado
		#si no, carga nuevamente el formulario	
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