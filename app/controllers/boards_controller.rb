class BoardsController < ApplicationController
  before_action :set_board, only: %i[ show edit update destroy ]

  # GET /boards or /boards.json
  def index
    per_page = 10

    @boards = Board.order(created_at: :desc).page(params[:page]).per(10)
    per_page = Board.count if params[:all]
    @boards = @boards.per(per_page)
  end

  # GET /boards/1 or /boards/1.json
  def show
    @x_arr = (0..@board.width - 1).to_a
    @y_arr = (0..@board.height - 1).to_a
    @tiles = @board.get_mapped_tiles(@x_arr, @y_arr)
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # POST /boards or /boards.json
  def create
    @board = Board.new(board_params)
    respond_to do |format|
      if @board.save
        @board.create_tile!
        format.html { redirect_to board_url(@board), notice: "Board was successfully created." }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1 or /boards/1.json
  def destroy
    @board.destroy

    respond_to do |format|
      format.html { redirect_to boards_url, notice: "Board was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_params
      params.require(:board).permit(:name, :email, :width, :height, :number_of_mines)
    end
end
