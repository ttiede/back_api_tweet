FROM ruby:2.4-slim

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /back_api_tweet
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME