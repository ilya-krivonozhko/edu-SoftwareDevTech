# syntax=docker/dockerfile:1
ARG RUBY_VERSION=3.4.4
FROM ruby:$RUBY_VERSION

# Устанавливаем зависимости
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

# Рабочая папка
WORKDIR /app

# Экспортим dev-окружение
ENV RAILS_ENV=development \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT=production:test \
    PORT=3000

# Копируем только Gemfile для установки бандла
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

# Копируем весь код
COPY . .

# Предоставляем возможность запускать bin/setup и сервер
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
