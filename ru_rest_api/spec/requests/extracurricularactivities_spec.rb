# spec/requests/extracurricularactivities_spec.rb
require 'rails_helper'

RSpec.describe 'Extracurricularactivities API', type: :request do
  # initialize test data 
  let!(:extracurricularactivities) { create_list(:extracurricularactivity, 10) }
  let(:extracurricularactivity_id) { extracurricularactivities.first.id }

  # Test suite for GET /extracurricularactivities
  describe 'GET /extracurricularactivities' do
    # make HTTP get request before each example
    before { get '/extracurricularactivities' }

    it 'returns extracurricularactivities' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /extracurricularactivities/:id
  describe 'GET /extracurricularactivities/:id' do
    before { get "/extracurricularactivities/#{extracurricularactivity_id}" }

    context 'when the record exists' do
      it 'returns the extracurricularactivity' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(extracurricularactivity_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:extracurricularactivity_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Extracurricularactivity/)
      end
    end
  end

  # Test suite for POST /extracurricularactivities
  describe 'POST /extracurricularactivities' do
    # valid payload
    let(:valid_attributes) { { name: 'Learn Elm', department: 'CSE', interest: 'Programming' } }

    context 'when the request is valid' do
      before { post '/extracurricularactivities', params: valid_attributes }

      it 'creates a extracurricularactivity' do
        expect(json['name']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/extracurricularactivities', params: { name: 'Foobar', department: 'CSE' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Interest can't be blank/)
      end
    end
  end

  # Test suite for PUT /extracurricularactivities/:id
  describe 'PUT /extracurricularactivities/:id' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/extracurricularactivities/#{extracurricularactivity_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /extracurricularactivities/:id
  describe 'DELETE /extracurricularactivities/:id' do
    before { delete "/extracurricularactivities/#{extracurricularactivity_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end