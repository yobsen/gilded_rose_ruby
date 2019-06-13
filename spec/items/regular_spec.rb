require_relative '../spec_helper'
require_relative '../../items/regular'
require_relative 'degradable_shared_examples'

describe Items::Regular do
  describe '#next_day' do
    it_behaves_like 'degradable'

    context 'sell_in undue' do
      let(:item) { described_class.new('Health Potion', 5, 10) }

      it 'decreases quality by 1 when sell_in > 0' do
        expect { item.next_day }.to change { item.quality }.by(-1)
      end
    end

    context 'sell_in overdue' do
      let(:item) { described_class.new('Health Potion', 0, 10) }

      it 'decreases quality by 2 when sell_in <= 0' do
        expect { item.next_day }.to change { item.quality }.by(-2)
      end
    end
  end
end
