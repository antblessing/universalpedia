
## Universalpedia:

Universalpedia is a Ruby on Rails production quality SaaS app that allows users to create their own wikis, and collaborate on other users wikis. Users can upgrade to premium membership to gain access to private wikis that only other premium members can view.

Created during my time in Bloc's Full Stack Web Development track.

## Features:
- Utilizes the Stripe gem for paid membership upgrades.
- Add other users as collaborators to your wiki, allowing them to add/remove information.
- Uses Device user authorization.

## Setup:
- Clone Universalpedia repository
- Bundle Install
- run rake db:create & rake db:migrate
- Run server with rails s
- Navigate to localhost:3000

Deployed on [Heroku](https://infinite-mountain-19093.herokuapp.com)
