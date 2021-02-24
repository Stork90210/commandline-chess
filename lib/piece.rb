# frozen_string_literal: true

class Piece

  def initialize(name, color, position)
    @name = name
    @position = position
    @color = color
    @directions = []
    @valid_moves = []
    @has_moved = false
    @token = get_token(name, color)
  end



end
