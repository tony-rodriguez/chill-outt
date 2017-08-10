class ArticleVersionsController < ApplicationController

  def show
    p "*" * 40
    p params
    @article = Article.find(params[:article_id])
    p @article
    @shown_version = @article.versions.find(params[:id])
    p @shown_version
  end

  private

end
