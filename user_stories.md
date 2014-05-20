User Stories
============

Version 0.0.5
-------------

###Games###

As a User, when I add a game to my list:
  - The system finds if the game exists or creates it if it does not `games`
  [DONE]
  - The system creates a new `user_game` association based on this game
  [DONE]
  - The completed flag is marked as true/false depending on the user response on the `user_game` object.
  [DONE]
As a User, when I remove a game from my list:
  - The system removes the `user_game` association.
  [DONE]
As a User, when I update a game:
  - The system only modifies data on the `user_game` association.
  [DONE]
As a User, when I request a list of games:
  - If the user id is specified, I get the list of games for that user.
  [DONE]
  - If the user id is not specified, I get a list of games for all users.
  [DONE]
As a User, when I show a specific game:
  - If the user is specified, I only see the game's data and my own completed flag.
  [DONE]
  - If the user is not specified, I only see the game's data.
  [DONE]

Game Routes:
  POST /users/:user_id/games => UserGames#create
  DELETE /users/:user_id/games/:id => UserGames#destroy
  PUT/PATCH /users/:user_id/games/:id => UserGames#update
  GET /users/:user_id/games => UserGames#index
  GET /games => Games#index
  GET /users/:user_id/game/:id => UserGames#show
  GET /games/:id => Games#show

###Tags###

As a User, when I tag a game on my list:
  - The system finds if the tag exists or creates it if it does not `tags`
  [DONE]
  - The system creates a new `game_tag` association based on the game/tag
  [DONE]
  - The score for that particular `game_tag` is increased by 1
  [DONE]
As a User, I cannot remove a tag from a game.
  [DONE]
As a User, I cannot update a tag.
  [DONE]
As a User, when I request a tag:
  - I should see the list of games that match the tag, with scores in order of highest to lowest.
  - I should see any data specific to that tag.
  [DONE]
As a User, I cannot request a list of tags.
  [DONE]

Tag Routes:
  POST /games/:game_id/tags => GameTags#create
  GET  /tags/:tag_id/games  => Games#index 
  GET  /tags/:tag_id        => Tags#show

###Users###

As a User, I can create a new user account.
[DONE]
As a User, I can delete my own account.
[DONE]
As a User, I can modify own own account.
[DONE]
As a User, I cannot request a list of users.
[DONE]
As a User, I can only view a user's profile.
[DONE]

User Routes:
  POST /users       => Users#create
  DELETE /users/:id => Users#destroy
  PUT /users/:id    => Users#update
  GET /users/:id    => Users#show
