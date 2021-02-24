# frozen_string_literal: true

require 'pry'

class Chessboard
  def initialize
    @height = 8
    @width = 8
    @board = Array.new(@height, Array.new(@width, ' '))
  end

  def draw
    @board.each_with_index do |row, index_row|
      topline = ''
      middleline = ''
      bottomline = ''
      row.each_with_index do |square, index_square|
        if (index_row + index_square).even?
          topline += '█████'
          middleline += "██#{square}██"
          bottomline += '█████'
        else
          topline += '     '
          middleline += "  #{square}  "
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
end

board = Chessboard.new

binding.pry
