require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'assigns a new user to @user' do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template("new")
    end
  end
end
