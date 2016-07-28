class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	before_action :set_article, except: [:index, :new, :create]
	
	# GET /articles (#index)
	def index
		# Obtiene todos los articles
		@articles = Article.all
		@article = current_user.email
		#permite mostrar el email del user en view index con clase @article
	end
	#GET /articles/:id
	def show
		# Encuentra un article por id
		# @article = Article.find(params[:id])
		# se fue a set_article

		@comment = Comment.new

		@article.update_visits_count
		#se define este metodo en el modelo article
	end

	#GET /articles/new
	def new
		@article = Article.new
	end
	#POST /articles
	def create
		# obsolete @article = Article.new(title: params[:article][:title],
							#	body: params[:article][:body])
		# obsolet @article = Article.new(article_params)
		
		@article = current_user.email.articles.new(article_params)
		# current_user tiene has_many :articles
		# por eso se le asocia .articles

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
		# @article = Article.find(params[:id])
		# se fue a set_article
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit				
		end
	end
	def edit
		# @article = Article.find(params[:id])
		# se fue a set_article
	end

	def destroy
		# @article = Article.find(params[:id])
		# se fue a set_article
		@article.destroy #Elimina el obj de la db
		redirect_to articles_path
	end

	private

	def set_article
		@article = Article.find(params[:id]) #cambiar a :id ...
		#re-factor y se elimina de :edit :show :update :destroy
	end

	def article_params
		params.require(:article).permit(:title, :body)
	end
end