class ArticlesController < ApplicationController
  def search
    if params[:query]
      @articles = Article.search(params[:query])
    else
      render :new
    end
  end
 
  def index
  	@articles = Article.all
  end

 end