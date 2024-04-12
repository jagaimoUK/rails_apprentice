# Use Ruby 3.2.1 as the base image
FROM ruby:3.2.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs npm
RUN npm install --global yarn

# Create a directory for the app
WORKDIR /myapp

# Copy Gemfile and Gemfile.lock
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install gems
RUN bundle install

# Copy the rest of the application
COPY . /myapp

# Set permissions for the database file
RUN mkdir -p /myapp/tmp/db
RUN touch /myapp/tmp/db/development.sqlite3
RUN chmod -R 777 /myapp/tmp/db

# Expose port 3000 for the Rails server
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]