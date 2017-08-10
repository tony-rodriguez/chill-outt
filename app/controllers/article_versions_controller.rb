class ArticleVersionsController < ApplicationController

  def show
    @article = Article.find(params[:article_id])
    @shown_version = @article.versions.find(params[:id])
  end

end
