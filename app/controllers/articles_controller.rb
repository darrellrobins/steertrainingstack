class ArticlesController < ApplicationController
	def index
		if params[:sort] == "votes"
			@articles = Article.order(votes_count: :desc)
		elsif params[:sort] == "recent"
			@articles = Article.order(created_at: :desc)
		elsif params[:sort] == "featured"
			@articles = Article.where(:featured => false)
		else
			@articles = Article.all
		end
		respond_to do |format|
      		format.html
      		format.json { render json: @articles, include: :comments, include: :votes }
    	end
	end
	def show ()
		@message = "in view"
		@article_id = params['id']
		params[:id]
        @article = Article.find(params[:id])
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		flash[:success] = "Thanks for sharing"
		if @article.save
			redirect_to article_path(@article)
		else
			flash[:error] = "Oops, didn't quite pan out"
			render :new
		end
	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		@article.title = article_params[:title]
		@article.body = article_params[:body]
		@article.author = article_params[:author]
		@article.url = article_params[:url]
		if @article.save
			flash[:success] = "Thanks for updating article titled " + @article.to_s
			redirect_to article_path(@article)
		else
			flash[:error] = "Oops, didn't quite pan out"
			render :edit
		end
	end		
	private
	def article_params
		params.require(:article).permit(:title,:body,:author,:url)
	end
end
