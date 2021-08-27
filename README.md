# Image Board
Just a typical danbooru-style image board.

# Requirements
* Postgres
* ImageMagick
* Ruby (3.0+)
* Node.js (Linux only)

# How To Run
    # Fill in your environment variables.
    cp .env.example .env

    bundle install
    bin/rake db:setup
    bin/rails server

# Licensing
Licensed under AGPL-3.0-only
