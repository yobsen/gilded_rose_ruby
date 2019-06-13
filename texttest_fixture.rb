#!/usr/bin/ruby -w
# frozen_string_literal: true

require 'pry'
require 'terminal-table'
require_relative 'gilded_rose'

DEFAULT_DAYS = 5
HEADINGS = %w[Name Sell_in Quality Class].freeze
items = [
  Item.new('+5 Dexterity Vest', 10, 20),
  Item.new('Aged Brie', 2, 0),
  Item.new('Elixir of the Mongoose', 5, 7),
  Item.new('Sulfuras, Hand of Ragnaros', 0, 80),
  Item.new('Sulfuras, Hand of Ragnaros', -1, 80),
  Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20),
  Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49),
  Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49),
  Item.new('Conjured Mana Cake', 3, 6)
]

days = (ARGV.first || DEFAULT_DAYS).to_i

gilded_rose = GildedRose.new(items)
(0...days).each do |day|
  gilded_rose.update_quality

  rows = gilded_rose.specified_items.map do |item|
    [item.name, item.sell_in, item.quality, item.class]
  end
  puts Terminal::Table.new(title: "Day #{day + 1}", headings: HEADINGS, rows: rows)
end
