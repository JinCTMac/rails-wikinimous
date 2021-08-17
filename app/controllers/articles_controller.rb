class ArticlesController < ApplicationController
  before_action :set_articles, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    # poggies
  end

  def new
    @article = Article.new
    # then in the respective view, we use the helper form_for to make the form
  end

  def create
    @article = Article.new(articles_params)
    @article.save

    # this takes us to the article show page
    redirect_to article_path(@article)
  end

  def edit
    # need to find the article to show it by id again
    # @article = Article.find(params[:id])
    # no longer need to do anything as before_action handles it
  end

  def update
    # to update a record, we need to:
    # 1: get its id via .find
    # 2: update with params[:article], aka we need articles_params again
    # @article = Article.find(params[:id])
    # no longer need to do anything as before_action handles it
    @article.update(articles_params)

    redirect_to article_path(@article)
  end

  def destroy
    # to destroy a record, we need to find the single record
    # and .destroy it
    # @article = Article.find(params[:id])
    # no longer need to do anything as before_action handles it
    @article.destroy
    # then we redirect back to main articles homepage
    redirect_to articles_path
  end

  private

  def articles_params
    params.require(:article).permit(:title, :content)
  end

  def set_articles
    @article = Article.find(params[:id])
  end
end
