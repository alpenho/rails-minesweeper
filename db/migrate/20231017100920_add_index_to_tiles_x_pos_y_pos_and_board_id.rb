class AddIndexToTilesXPosYPosAndBoardId < ActiveRecord::Migration[7.0]
  def change
    add_index :tiles, [:x_pos, :y_pos, :board_id], unique: true
  end
end
