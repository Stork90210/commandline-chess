# frozen_string_literal: true

require 'pry'
class Piece
  attr_reader :token

  def initialize(name, color, position)
    @name = name
    @position = position
    @color = color
    @directions = []
    @valid_moves = []
    @has_moved = false
    @token = get_token
  end

  def get_token
    if @color == 'white'
      chesspieces = { king: '♔', queen: '♕', rook: '♖', bishop: '♗', knight: '♘', pawn: '♙' }
      chesspieces[@name.to_sym]
    elsif @color == 'black'
      chesspieces = { king: '♚', queen: '♛', rook: '♜', bishop: '♝', knight: '♞', pawn: '♟︎' }
      chesspieces[@name.to_sym]
    end
  end
end

binding.pry
