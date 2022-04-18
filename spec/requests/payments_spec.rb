require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  describe 'GET /index' do
    before :each do
      get '/payments'
    end
    it 'renders the right tempelate' do
      expect(response).to render_template(:index)
    end

    it 'the response body includes the correct placeholder text' do
      expect(response.body).to include('Find me in app/views/payments/index.html.erb')
    end

    it 'the correct response status' do
      expect(response.status).to eq(200)
    end
  end
end
