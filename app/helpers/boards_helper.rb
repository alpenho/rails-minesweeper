module BoardsHelper
  def create_board(params)
    board = Board.new(params)
    ActiveRecord::Base.transaction do
      board.save

      tiles = []
      for x_pos in 0..board.width - 1 do
        for y_pos in 0..board.height - 1 do
          tiles << {
            mine: false,
            revealed: false,
            flagged: false,
            x_pos: x_pos,
            y_pos: y_pos,
            board_id: board.id
          }
        end
      end

      tile_indexes = (0..tiles.length - 1).to_a.shuffle
      board.number_of_mines.times do |i|
        index = tile_indexes.pop
        tiles[index][:mine] = true
      end
      Tile.insert_all(tiles)

      board
    end
  end

  def mapped_tiles(x_arr, y_arr, board)
    result = []

    tiles = Tile.where(x_pos: x_arr, y_pos: y_arr, board_id: board.id)
    tiles.each do |tile|
      result[tile.y_pos] = [] if result[tile.y_pos].nil?
      result[tile.y_pos][tile.x_pos] = tile
    end

    result
  end
end
