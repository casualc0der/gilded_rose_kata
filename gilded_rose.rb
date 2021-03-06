# frozen_string_literal: true

require_relative 'store_item_factory'
require_relative 'store_items'
require_relative 'store_item'

def update_quality(items)
  items.each do |item|
    store_item = StoreItem.new(item.name, item.sell_in, item.quality)
    store_item.tick
    item.sell_in = store_item.sell_in
    item.quality = store_item.quality
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]
