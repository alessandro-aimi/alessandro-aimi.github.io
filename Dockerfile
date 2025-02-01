# Base image: Ruby with necessary dependencies for Jekyll
FROM ruby:3.2

# Set the working directory inside the container
WORKDIR /app

# Copy Gemfile into the container (necessary for `bundle install`)
COPY Gemfile .

# Install bundler and dependencies + pre-link config
RUN gem install bundler:2.3.26 && bundle install && ln -s src/_config.yml src/_config_docker.yml .

# Enable configurations specific to the docker environment (_config_docker.yml)
ENV JEKYLL_ENV=docker

# Command to serve the Jekyll site mounted at /app/src (having a subdir prevents polluting the repo with build files)
CMD ["jekyll", "s", "-H", "0.0.0.0", "-w", "--config", "_config.yml,_config_docker.yml", "-s", "src"]
