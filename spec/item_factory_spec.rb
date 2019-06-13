require_relative 'spec_helper'
require_relative '../item_factory'

describe ItemFactory do
  describe '#cast' do
    let(:items) do
      [
        Item.new('+5 Dexterity Vest', 10, 20),
        Item.new('Aged Brie', 2, 0),
        Item.new('Elixir of the Mongoose', 5, 7),
        Item.new('Sulfuras, Hand of Ragnaros', -1, 80),
        Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49),
        Item.new('Conjured Mana Cake', 3, 6)
      ]
    end

    it 'casts to proper item classes' do
      expect(items.map { |item| ItemFactory.new(item).cast.class })
        .to eq [
          Items::Regular,
          Items::AgedBrie,
          Items::Regular,
          Items::Sulfuras,
          Items::BackstagePass,
          Items::Conjured
        ]
    end
  end
end
