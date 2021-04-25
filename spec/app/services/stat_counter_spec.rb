require 'rails_helper'

RSpec.describe StatCounter do
  let(:url) { create(:url) }
  let(:ip_1) { '192.168.0.1' }
  let(:ip_2) { '192.168.0.2' }

  subject { described_class.new(url.short) }

  describe '#call' do
    context 'with 1 view' do
      before(:example) { create(:url_stat, url: url, ip: ip_1) }

      it 'should return 1' do
        expect(subject.call).to eq(1)
      end
    end

    context 'with 2 views' do
      before(:example) do
        create(:url_stat, url: url, ip: ip_1)
        create(:url_stat, url: url, ip: ip_2)
      end

      it 'should return 2' do
        expect(subject.call).to eq(2)
      end
    end
  end
end
