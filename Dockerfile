FROM ruby:2.6.8

RUN apt-get update -qq
# RUN apt-get install -y --no-install-recommends libjemalloc2
# ENV LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so.2

RUN gem update --system 3.2.3
RUN gem install bundler:2.3

# RUN bundle config --global path "$GEM_HOME"
# RUN bundle config --global bin "$GEM_HOME/bin"


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# need to copy from project.
# if we want to from scrace project need to exec 'RUN rails new <project-name>'
# to get gemfile & gemfile.lock
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN bundle install

CMD rails server
