class CreateTiles < ActiveRecord::Migration[7.0]
  def change
    create_table :tiles do |t|
      t.boolean :mine
      t.boolean :revealed
      t.boolean :flagged
      t.integer :x_pos
      t.integer :y_pos
      t.integer :total_surrounding_mines
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
