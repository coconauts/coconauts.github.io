FROM ruby:2.3

RUN mkdir /code
WORKDIR /code

# Copy Gemfile first for better caching
COPY Gemfile Gemfile.lock* ./

# Install guide http://octopress.org/docs/setup/
RUN gem install bundler -v '~> 2.3.0'
RUN bundle install

# Copy the rest of the application
COPY . /code

# Locale changes required for rake generate
ENV RUBYOPT="-KU -E utf-8:utf-8"

EXPOSE 4000

CMD bundle exec rake preview
