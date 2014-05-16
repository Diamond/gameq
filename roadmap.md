Roadmap
=======

Feature List
------------

- User Accounts
    - Overall Game List
    - Console List
    - To-Do List
    - Prioritization of To-Do List
    - Ratings
    - Import Game Lists
        - Steam
        - Xbox Live
        - PSN
- Forums
     - Categories
     - Forum per category
     - Forum per game (auto-generated on-the-fly)
     - Posts per forum
     - Replies
- Signature Generator
- Avatar Generator
- Integration with 3rd party for resale info
- Wish Lists
- Pre-order Lists
- Achievement Integration
    - Steam
    - Xbox Live
    - PSN
- Score for completing to-do lists
    - Flat rate per game
- Import support for CSV, TXT

Feature Plan
------------

- v0.0.1
  - User account API
    + Can register for an account
    + Can login
    + Cannot register a duplicate account
    + Cannot register an invalid account
    + Cannot login with invalid credentials
    + User Model created and 100% spec coverage
    + User Controller created and 100% spec coverage
    + Can update their own account
    + Can delete their own account
    + Cannot delete another user's account
    + Cannot update another user's account
- v0.0.2
  - Game API
    + Can add a new game to the list
    + Can view games for an account
    + Can remove a game from the list
    + Can update a game
    + Game Structure:
      - id, audit, completed
- v0.0.3
  - Console API
    + Can associate a game with a console
    + Can view list of consoles
    + Console Structure:
      - id, audit, name
- v0.0.4
  - Game Tags API
    - Can add tags to a game
    - Can remove tags from a game
    - Can view tags for a game
    - Can view games for a matching tag
- v0.0.5
  - Code cleanup
  - User Story Review
