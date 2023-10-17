setup:
	bundle install
	yarn build
	yarn build:css
	rails db:drop
	rails db:migrate
	rails db:setup

start:
	rails server