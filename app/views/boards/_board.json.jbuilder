json.extract! board, :id, :name, :email, :width, :height, :number_of_mines, :created_at, :updated_at
json.url board_url(board, format: :json)
