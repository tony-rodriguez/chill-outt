require 'rails_helper'

RSpec.describe ArticleVersionsController, :type => :controller do

  before(:each) do
    @user = User.create(username: "martha.beans", password: "password", type: UserType.anything_but_admin)
    @first_article = Article.new(title: "Beans are great")
    @first_article.versions << ArticleVersion.new(content: "See Title", author: @user)
    @first_article.save
  end

  describe 'GET #show' do
    it 'responds successfully with an HTTP 200 status code' do
      get :show, params: { article_id: @first_article.id, id: @first_article.latest_version.id }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get :show, params: { article_id: @first_article.id, id: @first_article.latest_version.id }
      expect(response).to render_template("show")
    end

    it 'assigns an article to @article' do
      get :show, params: { article_id: @first_article.id, id: @first_article.latest_version.id }
      expect(assigns(:article)).to be_a Article
    end

    it 'assigns a version to @shown_version' do
      get :show, params: { article_id: @first_article.id, id: @first_article.latest_version.id }
      expect(assigns(:article_version)).to be_a ArticleVersion
    end
  end

  end
