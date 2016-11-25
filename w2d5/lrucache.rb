class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if count < @size
      if @cache.include?(el)
        add_repeated_el(el)
      else
        @cache << el
      end
    else
      if @cache.include?(el)
        add_repeated_el(el)
      else
        @cache.shift
        @cache << el
      end
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    @cache
  end

  private
  # helper methods go here!
  def add_repeated_el(el)
    @cache.delete(el)
    @cache << el
  end

end
