require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    until @game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      sleep(1)
      @sequence_length += 1
    end
  end

  def show_sequence
    puts "Here is the sequence"
    sleep(1)
    add_random_color
    @seq.each do |color|
      puts color
      sleep(1)
    end
    system('clear')
  end

  def require_sequence
    puts "What is the sequence?"
    @seq.each do |color|
      guess = gets.chomp
      if color != guess
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Well done!"
  end

  def game_over_message
    puts "Wrong sequence - game over. You made it to round:#{@sequence_length - 1}"
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1
  end
end

# __FILE__==$simon
# game = Simon.new
# game.play
