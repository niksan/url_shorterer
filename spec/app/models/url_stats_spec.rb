require 'rails_helper'

RSpec.describe UrlStat, type: :model do
  let(:url_stat) { create(:url_stat) }

  subject { url_stat }

  describe '#new' do
    it 'create without issues' do
      expect(subject).to be_truthy
    end
  end
end
