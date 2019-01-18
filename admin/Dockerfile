FROM golang:alpine as build
ENV VERSION=v1.7
WORKDIR /app
RUN apk update && apk add wget unzip build-base git bzr mercurial gcc 
COPY . /app
RUN go build

FROM alpine:latest
LABEL EMAIL="1141519465@qq.com"
LABEL AUTHOR="dalongrong"
WORKDIR /app
ENV PATH=$PATH:/usr/local/bin
COPY --from=build /app/admin-gearman /usr/local/bin/admin-gearman
ENTRYPOINT ["admin-gearman"]