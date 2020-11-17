require_relative "piece"
class Board
  def initialize
    @board = Array.new(8){Array.new(8)}
    fill_rows
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @board[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise "Invalid position: Empty space" if self[start_pos] == nil 
    raise "Invalid move" if self[end_pos] != nil
    piece = self[start_pos]
    start_color = self[start_pos].color
    if self[end_pos].color != start_color || self[end_pos].nil?
      self[start_pos] = nil
      self[end_pos] = piece
    end
  end

  def fill_rows
    (0...@board.length).each do |row|
      (0...@board.length).each do |col|
        if row < 2
          self[[row, col]] = Piece.new(:w)
        elsif row > 5
          self[[row, col]] = Piece.new(:b)
        end
      end
    end
  end

end
