require 'rails_helper'

RSpec.describe Shortener, type: :model do
  describe 'url shortening' do

    subject(:shortener_obj) { described_class.new }

    let(:shortener) { FactoryBot.create(:shortener) }

    it 'creates a new url record' do
      expect{ shortener }.to change { Shortener.count }.by(1)
    end

    describe '#generate_short_url' do
      let(:shorten_url) { shortener.shorten_url }
      it 'creates a short url' do
        allow(shortener_obj).to receive(:generate_short_url).and_return(shorten_url)
        expect(shortener_obj.generate_short_url).to eq(shorten_url)
      end
    end

    describe '#sanitize' do
      let(:original_url) { shortener.original_url }
      let(:sanitized_url) { shortener.sanitized_url }

      it 'sanitizes the url' do
        allow(shortener_obj).to receive(:sanitize).and_return(sanitized_url)
        expect(shortener_obj.sanitize).to eq(sanitized_url)
        expect(original_url).to_not eq(sanitized_url)
      end
    end
  end
end
