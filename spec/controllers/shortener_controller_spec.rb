require 'rails_helper'

RSpec.describe ShortenerController, type: :controller do
  describe "GET index" do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "POST create" do
    it 'renders the shortened template' do
      params = FactoryBot.attributes_for(:shortener)
      post :create, params: params
      last_url = Shortener.last
      expect(response).to redirect_to shortened_path(last_url.shorten_url)
    end
  end
end