# frozen_string_literal: true

class StoreItemFactory
  def self.klass(name)
    return AgedBrieItem if name.include?('Brie')
    return BackstagePassItem if name.include?('passes')
    return SulfurasItem if name.include?('Sulfuras')
    return ConjuredItem if name.include?('Conjured')

    NormalItem
  end
end
