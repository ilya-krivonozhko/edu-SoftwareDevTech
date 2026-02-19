# syntax=docker/dockerfile:1
ARG RUBY_VERSION=3.4.4
FROM ruby:$RUBY_VERSION

# Системные зависимости
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential \
      git \
      curl \
      libpq-dev \
      libvips \
      nodejs \
      npm \
      yarn \
      postgresql-client && \
    rm -rf /var/lib/apt/lists/*

# Рабочая директория
WORKDIR /app

# Development environment
ENV RAILS_ENV=development \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT=production:test \
    PORT=3000

# Устанавливаем гемы
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

# Копируем код (в dev он будет перекрыт volume)
COPY . .

# Запуск сервера
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
