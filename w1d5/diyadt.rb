class Stack
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map
  attr_accessor :map

  def initialize
    @map = []
  end

  def assign(key, value)
    if @map.empty?
      @map << [key, value]
    else
      @map.each do |pair|
        if pair[0] == key
          pair[1] = value
        else
          @map << [key, value]
        end
      end
    end
  end

  def lookup(key)
    @map.select { |pair| pair[0] == key }
  end

  def remove(key)
    @map.reject! { |pair| pair[0] == key }
  end

  def show
    @map
  end
end
