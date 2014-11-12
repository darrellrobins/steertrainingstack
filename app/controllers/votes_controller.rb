class VotesController < ApplicationController
  def create
  	@article = Article.find(params[:article_id])
  	@vote = @article.votes.new(:article_id => params[:article_id], :up => params[:up], :from => request.remote_ip)
  	if @vote.save
		flash[:success] = "Thanks for voting"
	else
		flash[:error] = "Oops, didn't quite pan out"
		@vote.errors[:from].each do | error |
			flash[:error] << '. ' << error
		end
	end
  	redirect_to articles_path(:sort=>params[:sort])
  end
end
