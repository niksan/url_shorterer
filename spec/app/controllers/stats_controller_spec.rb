git
require 'rails_helper'

RSpec.describe StatsController, type: :controller do
  let(:ip_1) { '192.168.0.1' }
  let(:ip_2) { '192.168.0.2' }
  let(:url) { create(:url) }

  describe 'GET index' do
    context 'with 0 views' do
      it 'should return 0 views' do
        get :index, { params: { url_id: url.short } }
        expect(response.body).to eq('0')
      end
    end

    context 'with 1 view' do
      before(:example) do
        StatIncrementer.call(short_code: url.short, ip: ip_1)
      end

      it 'should return 1 view' do
        get :index, { params: { url_id: url.short } }
        expect(response.body).to eq('1')
      end
    end

    context 'with 2 views' do
      before(:example) do
        StatIncrementer.call(short_code: url.short, ip: ip_1)
        StatIncrementer.call(short_code: url.short, ip: ip_2)
      end

      it 'should return 2 views' do
        get :index, { params: { url_id: url.short } }
        expect(response.body).to eq('2')
      end
    end
  end
end
