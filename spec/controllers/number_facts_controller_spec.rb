require 'rails_helper'

RSpec.describe NumberFactsController, :type => :controller do

  describe '-200-' do

    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end

    it 'should be able to go to index page' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'should be able to perform search' do
      allow(NumberAPI).to receive(:get_number_facts).and_return(['fact 1', 'fact 2'])
      get :search, { :format => :js }
      expect(response).to have_http_status(:success)
    end

    it 'should not throw error in case of exception' do
      allow(NumberAPI).to receive(:get_number_facts).and_raise(StandardError)
      get :search, { :format => :js }
      expect(response).to have_http_status(:success)
    end

  end

end
