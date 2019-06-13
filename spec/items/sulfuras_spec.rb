require_relative '../spec_helper'
require_relative '../../items/sulfuras'

describe Items::Sulfuras do
  describe '#next_day' do
    let(:item) { described_class.new('Sulfuras') }

    it "doesn't degrade" do
      item.next_day

      expect(item.quality).to eq 80
      expect(item.sell_in).to eq Float::INFINITY
    end
  end
end
