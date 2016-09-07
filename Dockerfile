FROM alpine:3.3

RUN mkdir /app
WORKDIR /app
COPY . /app/

ENV BUILD_PACKAGES curl-dev ruby-dev build-base
ENV BUNDLER_DEP_PACKAGES mariadb-dev sqlite-dev
ENV RUBY_PACKAGES ruby ruby-bundler ruby-io-console
ENV C_PACKAGES nginx zsh

# install deps and things needed (last line)
#RUN apk update && \
#    apk upgrade && \
#    apk add gcc gnupg curl ruby bash procps musl-dev make linux-headers \
#        zlib zlib-dev openssl openssl-dev libssl1.0

RUN apk update && \
    apk upgrade && \
    apk add $RUBY_PACKAGES $C_PACKAGES $BUILD_PACKAGES $BUNDLER_DEP_PACKAGES && \
    rm -rf /var/cache/apk/*

# get latest bundler
RUN gem install bundler --no-ri --no-rdoc

RUN bundle install

# remove deps
#RUN apk remove gcc gnupg curl ruby musl-dev make linux-headers

CMD "bundle exec puma"
