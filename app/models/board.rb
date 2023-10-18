class Board < ApplicationRecord
  has_many :tiles, dependent: :destroy

  validates :email, format: { with: /\A(.+)@(.+)\z/, message: "format is invalid"  }, uniqueness: { case_sensitive: false }
  validates :width, numericality: { greater_than: 0 }
  validates :height, numericality: { greater_than: 0 }
  validate  :mines_less_than_or_equal_total_tiles

  def mines_less_than_or_equal_total_tiles
    errors.add(:number_of_mines, "cannot be greater than total tiles") if number_of_mines > width * height
  end

  # Main Logic for creating board tile
  def create_tile!
    tiles = []
    for x_pos in 0..width - 1 do
      for y_pos in 0..height - 1 do
        tiles << {
          mine: false,
          revealed: false,
          flagged: false,
          x_pos: x_pos,
          y_pos: y_pos,
          board_id: id
        }
      end
    end

    tile_indexes = (0..tiles.length - 1).to_a.shuffle
    number_of_mines.times do |i|
      index = tile_indexes.pop
      tiles[index][:mine] = true
    end

    ActiveRecord::Base.transaction do
      Tile.insert_all(tiles)
    end
  end

  # To map board tiles into 2 dimensional Array
  def get_mapped_tiles(x_arr, y_arr)
    result = []

    tiles = Tile.where(x_pos: x_arr, y_pos: y_arr, board_id: id)
    tiles.each do |tile|
      result[tile.y_pos] = [] if result[tile.y_pos].nil?
      result[tile.y_pos][tile.x_pos] = tile
    end

    result
  end
end
