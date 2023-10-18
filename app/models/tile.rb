class Tile < ApplicationRecord
  belongs_to :board

  # algorithm to set `total_surrounding_mines`
  def calculate_surrounding_mines
    total_surrounding_mines = 0

    x_arr = (x_pos - 1..x_pos + 1).to_a
    y_arr = (y_pos - 1..y_pos + 1).to_a

    tiles = Tile.where(x_pos: x_arr, y_pos: y_arr, board_id: board_id)
    tiles.each do |tile_to_check|
      total_surrounding_mines += 1 if tile_to_check.mine
    end

    total_surrounding_mines
  end
end
