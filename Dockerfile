FROM ruby:2.7.2

ENV BUNDLER_VERSION=2.0.2

RUN apt-get update -qq && apt-get install -y build-essential curl

RUN gem install bundler -v 2.0.2

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./