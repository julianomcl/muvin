require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'home page access' do
    subject { get :index }
    it 'should select the Welcome index template for rendering' do
      expect(subject).to render_template('welcome/index')
    end
  end

end
