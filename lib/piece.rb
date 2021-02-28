# frozen_string_literal: true

require 'pry'

class Piece
  attr_reader :token, :dir

  def initialize(name, color, position)
    @name = name
    @position = position
    @color = color
    @all_dir = { N: [-1, 0], E: [0, 1], S: [1, 0], W: [0, -1], NE: [-1, 1], SE: [1, 1], SW: [1, -1], NW: [-1, -1] }
    # @dir = get_directions
    @valid_moves = []
    @has_moved = false

  end

  # def get_token
  #   case @color
  #   when 'black'
  #     chesspieces = { king: '♔', queen: '♕', rook: '♖', bishop: '♗', knight: '♘', pawn: '♙' }
  #     chesspieces[@name.to_sym]
  #   when 'white'
  #     chesspieces = { king: '♚', queen: '♛', rook: '♜', bishop: '♝', knight: '♞', pawn: '♟︎' }
  #     chesspieces[@name.to_sym]
  #   end
  # end

  # def get_directions
  #   case @name
  #   when 'king'
  #     @all_dir
  #   when 'rook'
  #     @all_dir.reject { |k, _v| %i[NE SE SW NW].include?(k) }
  #   when 'queen'
  #     @all_dir
  #   when 'bishop'
  #     @all_dir.reject { |k, _v| %i[N E S W].include?(k) }
  #   end
  # end

  # def populate_movelist(position, direction = nil)
  #   unless direction do
  #     for each direction
  #     populate_movelist(position + direction, direction)
  #     end
  #     return
  #   end

  # end
  #   add position to tracker array
  #   if posistion == nil && in_board?
  #   populate_movelist(position + direction, direction)
  #   end
  # end

  def paths(board, position = @position)
    @dir.each do |_key, dir|
      new_pos = [position[0] + dir[0], position[1] + dir[1]]
      follow_path(board, new_pos, dir)
    end
  end

  def follow_path(board, position, direction)
    return unless board.in_board?(position[0], position[1])

    @valid_moves << position
    new_pos = [position[0] + direction[0], position[1] + direction[1]]
    follow_path(board, new_pos, direction) if board.board[position[0]][position[1]].nil?
  end

end
