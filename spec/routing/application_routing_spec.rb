require 'rails_helper'

RSpec.describe "Routing to the application", :type => :routing do
  it "GET / routes to 'articles#index'" do
    expect(get: '/').to route_to('articles#index')
  end
end
