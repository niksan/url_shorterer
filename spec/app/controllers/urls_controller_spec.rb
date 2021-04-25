# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  let(:ip_1) { '192.168.0.1' }
  let(:ip_2) { '192.168.0.2' }
  let(:url) { create(:url) }

  describe 'POST create' do
    let(:json_payload) { { url: 'http://test.com' } }

    before(:example) do
      post :create, body: json_payload.to_json, as: :json
    end

    it 'should return 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should build short_url and return it' do
      expect(response.body).to match(%r{http?://[\S]+})
    end
  end

  describe 'GET show' do
    before(:example) do
      request.remote_addr = ip_1
      get :show, { params: { id: url.short } }
    end

    it 'should return 200' do
      expect(response).to have_http_status(:ok)
    end

    context 'one request from one ip address' do
      it 'should increment stat' do
        count = UrlStat.where(url_id: url.id).count
        expect(count).to eq(1)
      end

      it 'should return full url' do
        expect(response.body).to eq(url.full)
      end
    end

    context 'few requests from one ip address' do
      before(:example) do
        request.remote_addr = ip_1
        get :show, { params: { id: url.short } }
        get :show, { params: { id: url.short } }
      end

      it 'should increment stat' do
        count = UrlStat.where(url_id: url.id).count
        expect(count).to eq(1)
      end
    end

    context 'two requests from two ip address' do
      before(:example) do
        request.remote_addr = ip_1
        get :show, { params: { id: url.short } }

        request.remote_addr = ip_2
        get :show, { params: { id: url.short } }
      end

      it 'should increment stat' do
        count = UrlStat.where(url_id: url.id).count
        expect(count).to eq(2)
      end
    end
  end
end
