class ArticlesController < ApplicationController

	before_action :set_article, only: [:edit, :destroy, :update, :show ]

	def index
		@articles = Article.all	
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user = User.first
		if @article.save
			flash[:success] = "Article successfully created "
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @article.update(article_params)
			flash[:success] = "Article successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy

		flash[:danger] = "Article successfully deleted!"
		redirect_to articles_path
	end

	private

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :description)
	end

end