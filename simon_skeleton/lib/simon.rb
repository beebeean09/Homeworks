class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over 
      take_turn
      system("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.75
    end
  end

  def require_sequence
    puts "Repeat the sequence by entering the first letter of each color on a new line."
    answer = gets.chomp
    @seq.each do |color|
      if answer != color
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    random_color = COLORS.shuffle.first
    @seq << random_color
  end

  def round_success_message
    puts "Great! You passed this round."
  end

  def game_over_message
    puts "Sorry, game over!"
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end
