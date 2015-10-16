class ArticlesController < ApplicationController
  def search
    if params[:query]
      @articles = Article.search(params[:query])
    else
      render :new
    end
  end
 
  def index
  	puts params 
  	@articles = Article.search(params[:query])
  end

  def destroy
      @article = Article.search(params[:query])
      @article.destroy
      redirect_to '/'
  end

 end