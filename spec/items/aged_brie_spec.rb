require_relative '../spec_helper'
require_relative '../../items/aged_brie'
require_relative 'degradable_shared_examples'

describe Items::AgedBrie do
  describe '#next_day' do
    it_behaves_like 'degradable'

    let(:item) { described_class.new('Aged Brie', 5, 10) }

    it 'increases quality by 1' do
      expect { item.next_day }.to change { item.quality }.by(1)
    end

    context 'quality is maximum' do
      let(:item) { described_class.new('Aged Brie', 5, described_class::MAX_QUALITY) }

      it 'limits quality to maximum' do
        expect { item.next_day }.to change { item.quality }.by(0)
      end
    end
  end
end
