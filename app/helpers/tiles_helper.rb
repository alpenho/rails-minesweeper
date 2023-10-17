module TilesHelper
  # algorithm to set `total_surrounding_mines`
  def calculate_surrounding_mines(tile)
    return if tile.mine # no need to calculate if the tile have bomb
    total_surrounding_mines = 0
    board_id = tile.board_id

    x_arr = (tile.x_pos - 1..tile.x_pos + 1).to_a
    y_arr = (tile.y_pos - 1..tile.y_pos + 1).to_a

    tiles = Tile.where(x_pos: x_arr, y_pos: y_arr, board_id: tile.board_id)
    tiles.each do |tile_to_check|
      total_surrounding_mines += 1 if tile_to_check.mine
    end

    tile.total_surrounding_mines = total_surrounding_mines
    tile.save
  end
end
