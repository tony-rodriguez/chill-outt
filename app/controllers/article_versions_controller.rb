class ArticleVersionsController < ApplicationController
  before_action :set_version, only: [:edit, :update]

  def new
    @article_version = ArticleVersion.new
  end

  def create
    @article_version = ArticleVersion.new(version_params)
  end

  def edit #for drafts?

  end

  def update # for drafts?

  end

  private

  def set_version # if draft before publishing
    @article_version = ArticleVersion.find(params[:id])
  end

  def version_params
    params.require(:article_version).permit(:content, :author, :article)
  end
end
