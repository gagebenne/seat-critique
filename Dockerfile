FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /seat-critique
WORKDIR /seat-critique
ADD Gemfile /seat-critique/Gemfile
ADD Gemfile.lock /seat-critique/Gemfile.lock
RUN bundle install
ADD . /seat-critique
