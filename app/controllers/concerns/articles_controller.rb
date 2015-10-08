class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    if params[:query]
      @articles = Article.search(params[:query]).order("date DESC")
    else
      @articles = Article.all.order("date DESC")
    end
  end
 end