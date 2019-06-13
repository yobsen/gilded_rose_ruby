require_relative '../spec_helper'
require_relative '../../items/conjured'
require_relative 'degradable_shared_examples'

describe Items::Conjured do
  describe '#next_day' do
    it_behaves_like 'degradable'

    let(:item) { described_class.new('Conjured Mana Cake', 5, 10) }

    context 'sell_in undue' do
      let(:item) { described_class.new('Conjured Mana Cake', 5, 10) }

      it 'decreases quality by 2 when sell_in > 0' do
        expect { item.next_day }.to change { item.quality }.by(-2)
      end
    end

    context 'sell_in overdue' do
      let(:item) { described_class.new('Conjured Mana Cake', 0, 10) }

      it 'decreases quality by 4 when sell_in <= 0' do
        expect { item.next_day }.to change { item.quality }.by(-4)
      end
    end
  end
end
