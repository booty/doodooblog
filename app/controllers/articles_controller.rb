# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash.notice = "Article updated. Thanks, bro."
      redirect_to @article
    else
      flash.alert = "Couldn't update that article."
      render "edit"
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article deleted. PEACE!"
    redirect_to articles_path
  end

  protected

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
