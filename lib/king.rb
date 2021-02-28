require_relative 'piece'

class King < Piece

  def initialize(name, color, position)
    super
    @token = token
  end

  def token
    case @color
    when 'black' then '♔'
    when 'white' then '♚'
    end
  end
end