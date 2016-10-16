require 'rails_helper'

describe UsersController, :type => :controller do

  describe 'GET :new' do
    it 'should respond successfully' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe 'User sign up access' do
    subject { get :new }
    it 'should select the Sign Up template for rendering' do
      expect(subject).to render_template('users/new')
    end
  end

end