# ベースイメージの指定
FROM ruby:3.2

# Node.js と npm のインストール
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get install -y nodejs

# Yarn のインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y yarn

# 作業ディレクトリの設定
WORKDIR /app

# ソースコードのコピー
COPY ./src /app

# Ruby ライブラリのインストール
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install

# JavaScriptとCSSのセットアップ (importmapとesbuild)
RUN bundle exec rails turbo:install stimulus:install
RUN bundle exec rails importmap:install
RUN bundle exec rails javascript:install:esbuild
RUN yarn install

# その他の必要な設定やコマンドを追加
