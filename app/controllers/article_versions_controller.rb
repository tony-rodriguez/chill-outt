class ArticleVersionsController < ApplicationController
  before_action :set_version, only: [:edit, :update]

  def show
    @article = Article.find(params[:article_id])
    @shown_version = @article.versions.find(params[:id])
  end

  def create
    @article = Article.find(params[:article_id])
    @article_version = ArticleVersion.new(article: @article, author: current_user, content: @article.latest_version.content)
    if @article_version.save
      redirect_to edit_article_version_path(@article_version.article, @article_version)
    else
      redirect_to @article
    end
  end

  def edit
  end

  def update
    if @article_version.update(version_params)
      redirect_to article_version_path(@article_version.article, @article_version)
    else
      render 'edit'
    end
  end

  private

  def set_version
    @article_version = ArticleVersion.find(params[:id])
  end

  def version_params
    params.require(:article_version).permit(:content)
  end
end
