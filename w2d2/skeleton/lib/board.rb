class Board
  attr_accessor :cups
  attr_reader :name1, :name2, :player1_empty_cups, :player2_empty_cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, index|
      if index == 6 || index == 13
        cup = []
      else
        @cups[index] += [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    if (1...14).include?(start_pos)
      true
    else
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    if (1..6).include?(start_pos)
      start_pos -= 1
    end
    i = 1
    until stones.empty?
      new_pos = start_pos + i
      if new_pos > 13
        until new_pos < 13
          new_pos -= 13
        end
      end
      if (0..5).include?(new_pos)
        @cups[new_pos] << stones.pop
      elsif (7..12).include?(new_pos)
        @cups[new_pos] << stones.pop
      elsif new_pos == 6 && @name1 == current_player_name
        @cups[new_pos] << stones.pop
      elsif new_pos == 13 && @name2 == current_player_name
        @cups[new_pos] << stones.pop
      end
      i += 1
    end
    render
    next_turn(new_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    player1_empty_cups = 0
    player2_empty_cups = 0
    @cups[0..5].each do |cup|
      player1_empty_cups += 1 if cup.empty?
    end
    @cups[7..13].each do |cup|
      player2_empty_cups += 1 if cup.empty?
    end

    if player1_empty_cups == 6 || player2_empty_cups == 6
      return true
    else
      return false
    end
  end

  def winner
    if @cups[6].count > @cups[13].count
      return @name1
    elsif @cups[13].count > @cups[6].count
      return @name2
    else
      return :draw
    end
  end
end
