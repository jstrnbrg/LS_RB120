# We'll take an object-oriented approach to designing the solution, so we'll
# employ the steps we learned earlier:

# 1. Write a description of the problem and extract major nouns and verbs.
# 2. Make an initial guess at organizing the verbs into nouns and do a spike
# to explore the problem with temporary code.
# 3. Optional - when you have a better idea of the problem, model your thoughts
# into CRC cards.

# 1. Description
# Tic Tac Toe is a 2-player board game played on a 3x3 grid.
# Players take turns marking a square.
# The first player to mark 3 squares in a row wins.

# Nouns: Player, Board, Square, Game
# Verbs: Play, Mark

# Game
# Square
# Player
# - play
# - mark

# Let's write our classes. We'll create an initialize method for the classes,
# and start to think about possible "states" for the objects of the class.

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER
  attr_accessor :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @current_marker = FIRST_TO_MOVE
  end

  def play
    display_welcome_message
    loop do
      board.display_board(clear: false)
      loop do
        current_player_moves(board)
        break if board.full? || board.someone_won?
        board.display_board if human_turn?
      end
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
    display_goodbye_message
  end

  private

  def current_player_moves(board)
    if human_turn?
      human.move(board)
      @current_marker = COMPUTER_MARKER
    else
      computer.move(board)
      @current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    system 'clear'
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def display_welcome_message
    puts "Let's play Tic Toc. Your symbol is 'X', the computer's symbol is 'O'"
  end

  def display_goodbye_message
    puts "Thanks for playing"
  end

  def display_result
    board.display_board
    case board.winning_marker
    when HUMAN_MARKER
      puts "You won. Well done"
    when COMPUTER_MARKER
      puts "Computer won"
    else
      puts "Tie, the board is full."
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again?"
      answer = gets.chomp.downcase
      break if ["y", "n"].include?(answer)
      puts "Sorry, enter 'y' or 'n'"
    end
    answer == "y" ? true : false
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  attr_reader :squares
  def initialize
    @squares = initialize_board
  end

  def initialize_board
    (1..9).each_with_object({}) do |i, board|
      board[i] = Square.new
    end
  end

  def display_board(clear: true)
    system 'clear' if clear
    puts " #{squares[1]} | #{squares[2]} | #{squares[3]} "
    puts " #{squares[4]} | #{squares[5]} | #{squares[6]} "
    puts " #{squares[7]} | #{squares[8]} | #{squares[9]} "
  end

  def mark(square_index, marker)
    squares[square_index].set_marker(marker)
  end

  def unmarked_keys
    squares.keys.select { |key| squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # def count_human_marker(squares)
  #   squares.collect(&:status).count(TTTGame::HUMAN_MARKER)
  # end
  #
  # def count_computer_marker(squares)
  #   squares.collect(&:status).count(TTTGame::COMPUTER_MARKER)
  # end

  def reset
    squares = initialize
  end

  # def winning_marker
  #   WINNING_LINES.each do |line|
  #     if count_human_marker(@squares.values_at(*line)) == 3
  #       return TTTGame::HUMAN_MARKER
  #     elsif count_computer_marker(@squares.values_at(*line)) == 3
  #       return TTTGame::COMPUTER_MARKER
  #     end
  #   end
  #   nil
  # end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.status
      end
    end
    nil
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:status)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "
  attr_reader :status

  def initialize
    @status = " "
  end

  def set_marker(marker)
    @status = marker
  end

  def to_s
    status
  end

  def unmarked?
    @status == " "
  end

  def marked?
    status != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class Human < Player
  def initialize
    super("X")
  end

  def move(board)
    puts "Choose a square from #{board.unmarked_keys.join(', ')}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, not a valid square"
    end
    board.mark(square, marker)
  end
end

class Computer < Player
  def initialize
    super("O")
  end

  def move(board)
    square = board.unmarked_keys.sample
    board.mark(square, marker)
  end
end

# we'll kick off the game like this
game = TTTGame.new
game.play
