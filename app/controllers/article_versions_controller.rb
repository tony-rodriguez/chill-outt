class ArticleVersionsController < ApplicationController
  before_action :authenticate!, only: [:create, :update]
  before_action :get_version, only: [:show, :edit, :update]
  before_action :get_article, only: [:show, :create]

  def show
  end

  def create
    @article_version = ArticleVersion.new(article: @article,
                                          author: current_user,
                                          content: @article.latest_version.content,
                                          title: @article.latest_version.title
                                          )
    if authorized?(@article.first_version.author) && @article_version.save
      redirect_to edit_article_version_path(@article_version.article, @article_version)
    else
      @article_version = @article.latest_version
      @error_message = "You aren't authorized to contribute to this."
      render 'show'
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
  def get_version
    @article_version = ArticleVersion.find(params[:id])
  end

  def get_article
    @article = Article.find(params[:article_id])
  end

  def version_params
    params.require(:article_version).permit(:content, :is_draft, :title)
  end
end
