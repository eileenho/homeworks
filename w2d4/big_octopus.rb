fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
        'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#Sluggish Octopus
def longest_fish(fish_array)
  longest_fish = ""
  fish_array.each_with_index do |fish1, idx1|
    fish_array.each_with_index do |fish2, idx2|
      unless idx1 == idx2
        longest_fish = fish1 if fish1.length > fish2.length
      end
    end
  end
  longest_fish
end

#Dominant Octopus
def dom_longest_fish(fish_array)
  sorted = false
  until true
    sorted = true
    fish_array.each_index do |idx|
      unless idx.nil?
        if fish_array[i].length > fish_array[i + 1].length
          fish_array[i], fish_array[i + 1] = fish_array[i + 1], fish_array[i]
          sorted = false
        end
      end
    end
    sorted = true
  end
  fish_array.last
end

#Clever Octopus
def clever_longest_fish(fish_array)
  longest = fish_array.first
  fish_array[1..-1].each do |fish|
    longest = fish if fish.length > longest.length
  end
  longest
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
#Slow Dance
def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile_dir, i|
    return i if direction == tile_dir
  end
end

tiles_hash = { up: 0,
               right_up: 1,
               right: 2,
               right_down: 3,
               down: 4,
               left_down: 5,
               left: 6,
               left_up: 7 }

def constant_dance(direction, tiles_hash)
  tiles_hash[direction]
end
