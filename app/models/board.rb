class Board < ApplicationRecord
  has_many :tiles, dependent: :destroy
end
