FROM ruby:3.1.2-slim-bullseye

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

RUN set -eux && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libpq-dev \
      shared-mime-info \
      postgresql-client \
      && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app/

COPY Gemfile Gemfile.lock ./
RUN set -eux && \
    gem install bundler:$(sed -E -n -e '/^BUNDLED WITH$/, /^ +/ {s/^ +//; p}' Gemfile.lock | tail -n1) && \
    bundle install

RUN set -eux && \
    ln -sfv $(pwd)/bin/docker-entrypoint /docker-entrypoint

EXPOSE 3000
ENTRYPOINT ["/docker-entrypoint"]
CMD ["bin/rails", "server", "--binding=0.0.0.0"]
