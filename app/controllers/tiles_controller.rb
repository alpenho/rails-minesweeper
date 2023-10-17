class TilesController < ApplicationController
  before_action :set_tile, only: %i[ show edit update destroy ]

  # GET /tiles or /tiles.json
  def index
    @tiles = Tile.all
  end

  # GET /tiles/1 or /tiles/1.json
  def show
  end

  # GET /tiles/new
  def new
    @tile = Tile.new
  end

  # GET /tiles/1/edit
  def edit
  end

  # POST /tiles or /tiles.json
  def create
    @tile = Tile.new(tile_params)

    respond_to do |format|
      if @tile.save
        format.html { redirect_to tile_url(@tile), notice: "Tile was successfully created." }
        format.json { render :show, status: :created, location: @tile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tiles/1 or /tiles/1.json
  def update
    respond_to do |format|
      if @tile.update(tile_params)
        format.html { redirect_to tile_url(@tile), notice: "Tile was successfully updated." }
        format.json { render :show, status: :ok, location: @tile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiles/1 or /tiles/1.json
  def destroy
    @tile.destroy

    respond_to do |format|
      format.html { redirect_to tiles_url, notice: "Tile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tile
      @tile = Tile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tile_params
      params.require(:tile).permit(:mine, :revealed, :flagged, :x_pos, :y_pos, :total_surrounding_mines, :board_id)
    end
end
