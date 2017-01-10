FROM ruby:2.4-alpine
MAINTAINER Marcin Marcinkowski

# Directory for application
ENV APP_HOME /mars-robot

WORKDIR $APP_HOME
COPY . $APP_HOME

RUN bundle install

CMD ruby $APP_HOME/read.rb instructions/demo