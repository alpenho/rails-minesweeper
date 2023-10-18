# Rails Minesweeper
This is a Rails app where we can generate minesweeper board with a customized width and height of the board.

## Prerequisite

1. Ruby version 3.2.2
2. Rails version 7.0.8
3. yarn version 1.22.4

## To run it locally

1. Git clone the repository first and then move to the clone folder.
2. Run `make setup` inside the folder.
3. Run `make start` inside the folder.
4. Access the website by going to this `http://localhost:3000/`

## How to play

1. Access the website by going to this `http://localhost:3000/`
2. You will be encountered a form to create a board, fill it in.
3. After you're already generated the board, it will show up the board with all of the tile is closed.
4. Click in any tile that you want to reveal, if it's a bomb the image will change to a bomb, if not it will change to a number for giving out total bomb surrounding that tile.
5. There is no end game for this, you can continue to click all tile even after clicking a bomb.

## The Development of this app

1. The main logic of this app is inside of the model board and tiles, inside is the logic to create board tiles, mapping tiles into 2 dimensional array and then calculating total mine surrounding that tile.
2. Some of the things that worth mentioning is:
  1. The logic to create tiles, I use a insert all so that when creating the tile it will not looping and then creating tile one by one, but it will just only one query call.
  2. Implementation of pagination using kaminari and bootstrap 5
  3. The logic to check the total of mine surrounding of that tile.
  4. Creating the logic to play the game although it's still need to have an end game.
3. This development is using Bootstrap, Kaminari, local_time and many gemfile inherited from Rails 7 scaffold.

## Things that need to add

1. Create a started_at and end_at when user started to play the board and then will be ended with user clicking a bomb or clicking all tile that is not a bomb.
2. Create a flagged tile functionality, so that the user can flag the tile.
3. Use bootstrap fully and more beautifully, because right now the design website is not beautiful.
4. Add unit testing to all of the code, especially the main logic.
