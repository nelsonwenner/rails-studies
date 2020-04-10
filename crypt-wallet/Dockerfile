FROM ruby:2.7.1
RUN apt update -qq && apt install -y build-essential libpq-dev nodejs
RUN mkdir /home/backend
WORKDIR /home/backend
COPY Gemfile /home/backend/Gemfile
COPY Gemfile.lock /home/backend/Gemfile.lock
RUN bundle install
COPY . /home/backend

