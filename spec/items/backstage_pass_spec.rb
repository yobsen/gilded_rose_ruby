require_relative '../spec_helper'
require_relative '../../items/backstage_pass'
require_relative 'degradable_shared_examples'

describe Items::BackstagePass do
  describe '#next_day' do
    it_behaves_like 'degradable'

    let(:item) { described_class.new('Backstage passes to a TAFKAL80ETC concert', 11, 10) }

    context 'sell_in > 10' do
      let(:item) { described_class.new('Backstage passes to a TAFKAL80ETC concert', 11, 10) }

      it 'increases quality by 1' do
        expect { item.next_day }.to change { item.quality }.by(1)
      end
    end

    context 'sell_in <= 10' do
      let(:item) { described_class.new('Backstage passes to a TAFKAL80ETC concert', 10, 10) }

      it 'increases quality by 2' do
        expect { item.next_day }.to change { item.quality }.by(2)
      end
    end

    context 'sell_in <= 5' do
      let(:item) { described_class.new('Backstage passes to a TAFKAL80ETC concert', 5, 10) }

      it 'increases quality by 3' do
        expect { item.next_day }.to change { item.quality }.by(3)
      end
    end

    context 'sell_in <= 0' do
      let(:item) { described_class.new('Backstage passes to a TAFKAL80ETC concert', 0, 10) }

      it 'equates quality to 0' do
        item.next_day
        expect(item.quality).to eq 0
      end
    end
  end
end
