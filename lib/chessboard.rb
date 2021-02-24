# frozen_string_literal: true

require 'pry'
require_relative 'piece'
class Chessboard
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

  def setup_board
    @board[0][0] = Piece.new('rook', 'black', [0, 0])
    @board[0][1] = Piece.new('knight', 'black', [0, 1])
    @board[0][2] = Piece.new('bishop', 'black', [0, 2])
    @board[0][3] = Piece.new('queen', 'black', [0, 3])
  end
end

binding.pry
