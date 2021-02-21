# frozen_string_literal: true

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
end
