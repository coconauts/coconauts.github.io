#FROM octopress/octopress
#FROM ruby:2.3-alpine
#FROM ruby:1.9.3
FROM ruby:2.3

RUN mkdir /code
WORKDIR /code

ADD . /code

# Locale changes required for rake generate
ENV RUBYOPT="-KU -E utf-8:utf-8"

# Install guide http://octopress.org/docs/setup/
RUN gem install bundler
RUN bundle install

# RUN rake install

CMD rake preview
