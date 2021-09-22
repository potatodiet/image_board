# Image Board
Just a typical danbooru-style image board.

A demo can be found at [ib.potatodiet.ca](https://ib.potatodiet.ca).

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
