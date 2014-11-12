class CommentsController < ApplicationController
  def new
  	@comment = Comment.new
  end

  def create
  	@article = Article.find(params[:article_id])
  	@comment = @article.comments.new(:article_id => params[:article_id], :comment => params[:comment][:comment])
  	if @comment.save
		flash[:success] = "Thanks for commenting" + comments_params.to_s
		redirect_to articles_path(:sort=>params[:sort])
	else
		flash[:error] = "Oops, didn't quite pan out"
		render :new
	end

  end
  def comments_params
  	params.require(:comment).permit(:article_id,:comment)
  end
end
