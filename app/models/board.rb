class Board < ApplicationRecord
  has_many :tiles, dependent: :destroy

  validates :email, format: { with: /\A(.+)@(.+)\z/, message: "format is invalid"  }, uniqueness: { case_sensitive: false }
  validates :width, numericality: { greater_than: 0 }
  validates :height, numericality: { greater_than: 0 }
  validate  :mines_less_than_or_equal_total_tiles

  def mines_less_than_or_equal_total_tiles
    errors.add(:number_of_mines, "cannot be greater than total tiles") if number_of_mines > width * height
  end
end
