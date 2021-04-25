require 'rails_helper'

RSpec.describe UrlCreator do
  let(:url_str) { 'http://test.com' }
  let(:short_url_generator) { ShortUrlGenerator }

  subject { described_class.new(url: url_str, short_url_generator: short_url_generator) }

  describe '#call' do
    it 'should return short_url string' do
      res = subject.call
      expect(res).to be_a(String)
      expect(res.size).to eq(9)
    end

    context 'was generated already existed short string' do
      before(:example) do
        allow(Url).to receive(:create!).and_raise(ActiveRecord::RecordInvalid)
      end

      it 'should not to create new Url instance' do
        expect(subject.call).to be_nil
      end
    end
  end
end
