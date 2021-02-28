# frozen_string_literal: true

require_relative 'piece'
require_relative 'rook'
require 'pry'

class Chessboard
  attr_accessor :board

  def initialize
    @height = 8
    @width = 8
    # @board = Array.new(@height, Array.new(@width, nil))
    @board = Array.new(@height) { Array.new(@width) }
  end

  def draw
    @board.each_with_index do |row, index_row|
      topline = ''
      middleline = ''
      bottomline = ''
      row.each_with_index do |square, index_square|
        if (index_row + index_square).even?
          topline += '█████'
          middleline += "██#{square ? square.token : '█'}██"
          bottomline += '█████'
        else
          topline += '     '
          middleline += "  #{square ? square.token : ' '}  "
          bottomline += '     '
        end
      end
      puts "   #{topline}"
      puts " #{@height - index_row} " + middleline
      puts "   #{bottomline}"
    end
    puts ''
    puts '     A    B    C    D    E    F    G    H  '
  end

  def to_chess_notation(array)
    return nil unless array[0] >= 0 && array[0] <= @height - 1 && array[1] >= 0 && array[1] <= @width - 1

    letter = (array[1] + 97).chr
    number = @height - array[0]
    letter + number.to_s
  end

  # TODO: Add error catching for invalid strings.
  def to_array_notation(string)
    return nil unless string.length == 2

    splitted_string = string.split(//)
    row = @height - splitted_string[1].to_i
    col = splitted_string[0].ord - 97
    [row, col]
  end

  def set_up
    @board[0][0] = Rook.new('rook', 'black', [0, 0])
    @board[0][1] = Piece.new('knight', 'black', [0, 1])
    @board[0][2] = Piece.new('bishop', 'black', [0, 2])
    @board[0][3] = Piece.new('queen', 'black', [0, 3])
    @board[0][4] = Piece.new('king', 'black', [0, 4])
    @board[0][5] = Piece.new('bishop', 'black', [0, 5])
    @board[0][6] = Piece.new('knight', 'black', [0, 6])
    @board[0][7] = Rook.new('rook', 'black', [0, 7])

    8.times do |index|
      @board[1][index] = Piece.new('pawn', 'black', [1, index])
    end

    @board[7][0] = Rook.new('rook', 'white', [7, 0])
    @board[7][1] = Piece.new('knight', 'white', [7, 1])
    @board[7][2] = Piece.new('bishop', 'white', [7, 2])
    @board[7][3] = Piece.new('queen', 'white', [7, 3])
    @board[7][4] = Piece.new('king', 'white', [7, 4])
    @board[7][5] = Piece.new('bishop', 'white', [7, 5])
    @board[7][6] = Piece.new('knight', 'white', [7, 6])
    @board[7][7] = Rook.new('rook', 'white', [7, 7])

    8.times do |index|
      @board[6][index] = Piece.new('pawn', 'white', [1, index])
    end
  end

  def in_board?(row, col)
    row >= 0 && row < @height && col >= 0 && col < @width
  end
end

board = Chessboard.new
board.set_up
binding.pry
