require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do
  # let(:user) { User.create(username: "martha.beans", password: "password")}
  # let(:first_version) { first_article.versions.create(content: "See title", author: user) }
  # let(:first_article) { Article.create!(title: "Beans are great", version: ) }

  UserType.create(name: "admin")
  UserType.create(name: "user")

  before(:each) do
    @user = User.create(username: "martha.beans", password: "password", type: UserType.anything_but_admin)
    @first_article = Article.new(title: "Beans are great")
    @first_article.versions << ArticleVersion.new(content: "See Title", author: @user)

    @first_article.save
    @first_article.versions.last
  end

  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'assigns a new article to @article' do
      get :new
      expect(assigns(:article)).to be_a_new Article
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe 'GET #show' do

    xit 'responds successfully with an HTTP 200 status code' do
      get :show, params: {id: @first_article.id}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    xit 'assigns a article to @article' do
      get :show, params: {id: @first_article.id}
      expect(assigns(:article)).to be_a Article
    end

    xit 'renders the new template' do
      get :show, params: {id: @first_article.id}
      expect(response).to render_template("show")
    end

  end
end
