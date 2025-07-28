FROM ruby:3.2

RUN mkdir /app
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Copy Gemfile first for better caching
COPY Gemfile ./
COPY Gemfile.lock* ./

# Install bundler and gems
RUN gem install bundler
RUN bundle install

# Copy the rest of the application
COPY . /app

# Ensure gems are available
RUN bundle install

EXPOSE 4000

# Use Jekyll 4 serve command
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--livereload"]