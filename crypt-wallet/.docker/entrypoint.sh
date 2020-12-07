#!/bin/bash

bundle install
rails db:create
rails db:migrate
rails db:seed
rails server -p 3333 -b 0.0.0.0
