require 'rails_helper'

RSpec.describe StatIncrementer do
  let(:url) { create(:url) }
  let(:ip) { '192.168.0.1' }
  let(:ip_2) { '192.168.0.2' }

  subject { described_class.new(short_code: url.short, ip: ip) }

  describe '#let' do
    context 'stat record is not present yet' do
      it 'should create one stat item' do
        subject.call
        count = UrlStat.where(url_id: url.id, ip: ip).count
        expect(count).to eq(1)
      end

      it 'should return string' do
        expect(subject.call).to be_a(Url)
      end
    end

    context 'stat record already present' do
      before(:example) { subject.call }

      it 'should not create new record' do
        count = UrlStat.where(url_id: url.id, ip: ip).count
        expect(count).to eq(1)
        subject.call
        count = UrlStat.where(url_id: url.id, ip: ip).count
        expect(count).to eq(1)
      end
    end

    context 'requests from different ips' do
      it 'should create 2 stat records' do
        subject.call
        described_class.call(short_code: url.short, ip: ip_2)
        count = UrlStat.where(url_id: url.id).count
        expect(count).to eq(2)
      end
    end
  end
end
