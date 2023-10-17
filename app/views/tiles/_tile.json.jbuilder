json.extract! tile, :id, :mine, :revealed, :flagged, :x_pos, :y_pos, :total_surrounding_mines, :board_id, :created_at, :updated_at
json.url tile_url(tile, format: :json)
