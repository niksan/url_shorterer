require 'rails_helper'

RSpec.describe ShortUrlGenerator do
  let(:url) { 'http://test.com' }

  subject { described_class.new(url) }

  describe '#call' do
    context 'one call' do
      it 'should generate short string' do
        res = subject.call
        expect(res).to be_a(String)
        expect(res.size).to eq(9)
      end
    end

    context 'sequence of calls' do
      it 'should have different results' do
        call_1 = subject.call
        call_2 = subject.call
        expect(call_1).not_to eq(call_2)
      end
    end
  end
end
