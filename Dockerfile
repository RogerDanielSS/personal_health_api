# Use an official Ruby image as the base image
FROM ruby:3.0.1

# Install dependencies as root first
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Create app directory and set up user
RUN mkdir /app
WORKDIR /app

# Create user and set permissions
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID appgroup && \
    useradd -u $UID -g appgroup -m appuser && \
    chown -R appuser:appgroup /app

# Copy Gemfiles while still root
COPY --chown=appuser:appgroup Gemfile Gemfile.lock /app/

# Install gems as root (needed for native extensions)
RUN bundle install

# Switch to appuser
USER appuser

# Copy the rest of the application
COPY --chown=appuser:appgroup . /app/

# Precompile assets (if needed, for production)
# RUN bundle exec rake assets:precompile

# Expose the default Rails port
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]