# frozen_string_literal: true

require_relative '../gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    let(:item) { Item.new('Health Potion', 1, 1) }
    let(:gilded_rose) { described_class.new([item]) }

    it 'calls ItemFactory' do
      expect(ItemFactory).to receive(:new).with(item).and_call_original
      gilded_rose.update_quality
    end
  end
end
