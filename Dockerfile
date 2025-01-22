
# Use an official Ruby image as the base image
FROM ruby:3.0.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock /app/

# Install RubyGems and Bundler dependencies
RUN gem install bundler && bundle install

# Copy the entire application to the container
COPY . /app/

# Precompile assets (if needed, for production)
# RUN bundle exec rake assets:precompile

# Expose the default Rails port
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
