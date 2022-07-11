FROM ruby:3.0.4
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /assessment-tool-point-b
COPY Gemfile /assessment-tool-point-b/Gemfile
COPY Gemfile.lock /assessment-tool-point-b/Gemfile.lock
RUN bundle install
RUN rails turbo:install:redis
RUN rails assets:precompile
RUN rails tailwindcss:build

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
