class ArticlesController < ApplicationController
before_action :set_article, only: [:show]

  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_param)
    @article.save
    redirect_to article_path(@article)
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end

def article_params
  params.require(:article).permite(:title, :content)
end
