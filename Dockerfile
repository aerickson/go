FROM alpine:3.3
RUN apk add --no-cache ruby
RUN apk add --no-cache nginx
RUN apk add --no-cache zsh
