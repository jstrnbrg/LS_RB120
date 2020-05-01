class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome"
  end

  def display_goodbye_message
    puts "Goodbye"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "You won"
    elsif human.move < computer.move
      puts "Computer won"
    else
      puts "It's a tie"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be 'y' or 'n'"
    end
    answer == 'y' ? true : false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

class Move
  OPTIONS = ['rock', 'paper', 'scissors']
  def initialize(choice)
    @value = choice
  end

  def scissors?
    @value == "scissors"
  end

  def rock?
    @value == "rock"
  end

  def paper?
    @value == "paper"
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name
  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    puts "What's you name?"
    name = nil
    loop do
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, invalid name. Try again"
    end
    self.name = name
  end

  def choose
    puts "Please choose your move:"
    choice = nil
    loop do
      choice = gets.chomp
      break if Move::OPTIONS.include?(choice)
      puts "Sorry, invalid move. Try again"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ["Jonny", "Ben", "Alfred"].sample
  end

  def choose
    self.move = Move.new(Move::OPTIONS.sample)
  end
end

RPSGame.new.play
