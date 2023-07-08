class TicTacToe
    WIN_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
      [0, 4, 8], [2, 4, 6] # Diagonals
    ]
  
    def initialize
      @board = Array.new(9, " ")
    end
  
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
  
    def input_to_index(input)
      input.to_i - 1
    end
  
    def move(index, player_token)
      @board[index] = player_token
    end
  
    def position_taken?(index)
      @board[index] != " "
    end
  
    def valid_move?(index)
      index.between?(0, 8) && !position_taken?(index)
    end
  
    def turn_count
      @board.count { |position| position != " " }
    end
  
    def current_player
      turn_count.even? ? "X" : "O"
    end
  
    def turn
      puts "Please enter a number between 1 and 9:"
      input = gets.strip
      index = input_to_index(input)
  
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        puts "Invalid move. Please try again."
        turn
      end
    end
  
    def won?
      WIN_COMBINATIONS.detect do |combination|
        position_taken?(combination[0]) && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
      end
    end
  
    def full?
      turn_count == 9
    end
  
    def draw?
      full? && !won?
    end
  
    def over?
      won? || draw?
    end
  
    def winner
      if winning_combination = won?
        @board[winning_combination[0]]
      end
    end
  
    def play
      display_board
  
      until over?
        turn
      end
  
      if won?
        puts "Congratulations #{winner}! You won!"
      else
        puts "It's a draw!"
      end
    end
  end

  require_relative "../lib/tic_tac_toe"

game = TicTacToe.new
game.play