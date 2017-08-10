class ArticlesController < ApplicationController
  # before_action :set_article, only: [:edit, :update]

  def new
    @article = Article.new
    @article.versions.build
  end

  def create
    @article = Article.new(article_params)
    @article.versions.first.author = current_user

    if @article.save
      p @article
      redirect_to article_version_path(@article, @article.latest_version)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
    redirect_to article_version_path(@article.latest_version)
  end

  # def edit
  #   @article = Article.find(params[:id])
  # end

  private
  def article_params
    params.require(:article).permit(:title, versions_attributes: [:content])
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
