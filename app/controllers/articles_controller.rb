class ArticlesController < ApplicationController
  include ArticlesHelper


  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
  def index
    @articles = Article.all
  end

  def show 
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def create
    #render plain: params[:article].inspect
    #@article = Article.new(params[:article])
    @article = Article.new(article_params)
    if @article.save
      flash.notice = "Article '#{@article.title}' Created!"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash.notice = "Article '#{@article.title}' Updated!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' Deleted!"
    redirect_to articles_path
  end

end


