class ArticlesController < ApplicationController
  # before_action :set_article, only: [:edit, :update]

  def new
    @article = Article.new
    @article.versions.build
  end

  def create
    @article = Article.new(article_params)
    @article.versions.first.author_id = 1 # current_user eventually

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, versions_attributes: [:content])
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
