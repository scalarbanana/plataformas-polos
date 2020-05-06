FROM ruby:2.7

LABEL maintainer="Ariel Santos <ariel.santos@dcc.ufmg.br>"

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install --no-install-recommends nodejs yarn \
    && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.1.4 \
    && bundle config --global frozen 1 \
    && bundle config set without 'development test' \
    && bundle config set deployment 'true' \
    && bundle install

COPY package.json yarn.lock ./
RUN yarn install --production

COPY . .

ENV RACK_ENV=production \
    NODE_ENV=production \
    RAILS_ENV=production \
    RAILS_SERVE_STATIC_FILES=true \
    RAILS_LOG_TO_STDOUT=true \
    RACK_TIMEOUT_SERVICE_TIMEOUT=30

ENTRYPOINT ["/bin/sh", "-c"]
CMD "bundle exec puma -C config/puma.rb"
