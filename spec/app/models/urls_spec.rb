require 'rails_helper'

RSpec.describe Url, type: :model do
  let(:url) { create(:url) }

  subject { url }

  describe '#new' do
    it 'create without issues' do
      expect(subject).to be_truthy
    end
  end
end
