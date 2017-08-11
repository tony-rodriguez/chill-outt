class ArticlesController < ApplicationController
  before_action :authenticate!, only: [:new, :create, :update]
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
      current_user.promote_to_admin_if_ready
      redirect_to article_version_path(@article, @article.latest_version)
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_back(fallback_location: root_path)
    else
      redirect_to @article
    end
  end

  private
  def article_params
    params.require(:article).permit(:is_featured, versions_attributes: [:content, :is_draft, :title])
  end

  def get_article
    @article = Article.find(params[:id])
  end
end
