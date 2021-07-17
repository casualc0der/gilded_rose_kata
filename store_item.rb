# frozen_string_literal: true

class StoreItem
  def initialize(name, sell_in, quality)
    @item = StoreItemFactory.klass(name).new(sell_in, quality)
  end

  def tick
    @item.tick
  end

  def quality
    @item.quality
  end

  def sell_in
    @item.sell_in
  end
end
