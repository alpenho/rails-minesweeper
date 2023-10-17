module BoardsHelper
  def build_board(params)
    board = Board.new(params)

    tiles = []
    for x_pos in 0..board.width - 1 do
      for y_pos in 0..board.height - 1 do
        tiles << {
          mine: false,
          revealed: false,
          flagged: false,
          x_pos: x_pos,
          y_pos: y_pos
        }
      end
    end

    tile_indexes = (0..tiles.length - 1).to_a.shuffle
    board.number_of_mines.times do |i|
      index = tile_indexes.pop
      tiles[index][:mine] = true
    end

    board.tiles.build(tiles)
    board
  end
end
