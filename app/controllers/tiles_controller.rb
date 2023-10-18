class TilesController < ApplicationController
  include TilesHelper

  before_action :set_tile, only: %i[ check_surrounding_tile ]
  before_action :set_board, only: %i[ check_surrounding_tile ]

  def check_surrounding_tile
    respond_to do |format|
      if check(@tile)
        format.html { redirect_to board_url(@board), notice: "Tile was successfully checked." }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { redirect_to board_url(@board), alert: @tile.errors[:base].first }
        format.json { render :show, status: :unprocessable_entity, location: @board }
      end
    end
  end

  private
    def set_tile
      @tile = Tile.find(params[:tile_id])
    end

    def set_board
      @board = Board.find(params[:board_id])
    end
end
