FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y apt-utils build-essential  nodejs
RUN mkdir /rails-project
WORKDIR /rails-project
COPY ./Gemfile /rails-project/Gemfile
COPY ./Gemfile.lock /rails-project/Gemfile.lock
RUN bundle install
COPY . /rails-project
