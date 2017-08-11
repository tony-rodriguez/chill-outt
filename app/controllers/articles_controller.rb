class ArticlesController < ApplicationController
  before_action :authenticate!, only: [:new, :create]
  before_action :get_article, only: [:show, :edit, :update]

  def index
    @featured_articles = Article.featured
  end

  def show
    redirect_to article_version_path(@article, @article.latest_version)
  end

  def search
    @search_param = params[:q]
    @search_results = Article.search(@search_param)
    render :search
  end

  def new
    @article = Article.new
    @article.versions.build
  end

  def create
    @article = Article.new(article_params)
    @article.versions.first.author = current_user

    if @article.save
      redirect_to article_version_path(@article, @article.latest_version)
    else
      render 'new'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, versions_attributes: [:content])
  end

  def get_article
    @article = Article.find(params[:id])
  end
end
