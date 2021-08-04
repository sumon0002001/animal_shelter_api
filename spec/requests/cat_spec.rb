require 'rails_helper'

RSpec.describe 'cats API', type: :request do
  # initialize test data
  let!(:cats) { create_list(:cat, 20) }
  let(:cat_id) { cats.first.id }

  # Test suite for GET /cats
  describe 'GET /cats' do
    # make HTTP get request before each example
    before { get '/cats' }

    it 'returns cats' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /cats/:id
  describe 'GET /cats/:id' do
    before { get "/cats/#{cat_id}" }

    context 'when the record exists' do
      it 'returns the cat' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(cat_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:cat_id) { 1001 }

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Cat with 'id'=100/)
      end
    end
  end

  describe 'POST /cats' do
    # valid payload
    let(:valid_attributes) { { pet_name: 'Meow', pet_color: 'black', age:1 } }

    context 'when the request is valid' do
      before { post '/cats', params: valid_attributes }

      it 'creates a cat' do
        expect(json['pet_name']).to eq('Meow')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/cats', params: { pet_name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Pet color can't be blank, Age can't be blank/)
      end
    end
  end
end