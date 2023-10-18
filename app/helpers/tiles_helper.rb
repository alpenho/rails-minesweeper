module TilesHelper
  def check(tile)
    ActiveRecord::Base.transaction do
      if !tile.mine
        tile.total_surrounding_mines = tile.calculate_surrounding_mines
      end

      tile.revealed = true
      tile.save
    end

    tile.errors.add(:base, "You lose! You're clicking a bomb!") if tile.mine
    tile.errors.blank?
  end
end
