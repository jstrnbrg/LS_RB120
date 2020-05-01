class Game
  attr_accessor :player, :dealer, :deck
  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def deal_initial_cards
    player.cards = player.deal(2, deck)
    dealer.cards = dealer.deal(2, deck)
  end

  def show_initial_cards
    puts "The player's cards are #{player.cards.join(', ')}"
    puts "Player's value: #{player.total}"
    puts "The dealer's cards are #{dealer.cards.join(', ')}"
    puts "Dealer's value: #{dealer.total}"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def reset
    system 'clear'
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  def show_score
    puts "Result: Player: #{player.total}, Dealer: #{dealer.total}"
  end

  def show_winner
    if player.busted?
      puts "Dealer won"
    elsif dealer.busted?
      puts "Player won"
    elsif player.won?(dealer)
      puts "Player won"
    elsif dealer.won?(player)
      puts "Dealer won"
    else
      puts "It's a tie"
    end
  end

  def show_result
    show_score
    show_winner
  end

  # rubocop:disable all
  def start
    loop do
      deal_initial_cards
      show_initial_cards
      player.turn(deck)

      if player.busted?
        show_result
        if play_again?
          reset
          next
        else
          break
        end
      end

      dealer.turn(deck)
      if dealer.busted?
        show_result
        if play_again?
          reset
          next
        else
          break
        end
      end
      show_result
      play_again? ? reset : break
    end
    puts "Thank you for playing Twenty-One. Goodbye!"
  end
  # rubocop:enable all
end

module Hand
  def total
    total = 0
    cards.each do |card|
      total += if ['J', 'Q', 'K', 'A'].include?(card.value[1])
                 10
               else
                 card.value[1].to_i
               end
    end
    total
  end

  def deal(n, deck)
    dealed_cards = []
    n.times do
      dealed_cards << deck.cards.pop
    end
    dealed_cards
  end

  def hit(deck)
    cards << deal(1, deck)[0]
  end

  def busted?
    total > 21
  end

  def won?(other_player)
    total > other_player.total
  end
end

class Player
  attr_accessor :cards
  include Hand

  def initialize
    @cards = nil
  end

  def turn(deck)
    result = nil
    loop do
      puts "Do you want to 'hit' or 'stay'? h/s"
      result = gets.chomp
      break if ["h", "s"].include?(result)
      puts "Not valid, try again."
    end
    hit(deck) if result == "h"
  end
end

class Dealer
  attr_accessor :cards
  include Hand

  def initialize
    @cards = nil
  end

  def turn(deck)
    until total > 16
      hit(deck)
    end
  end
end

class Deck
  SUITS = ['H', 'D', 'S', 'C']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  attr_reader :cards

  def initialize
    @cards = initialize_deck
  end

  def initialize_deck
    cards = []
    card_arr = SUITS.product(VALUES).shuffle
    card_arr.each do |card|
      cards << Card.new(card)
    end
    cards
  end
end

class Card
  attr_accessor :value

  def initialize(arr)
    @value = arr
  end

  def to_s
    value.join.to_s
  end
end

Game.new.start
