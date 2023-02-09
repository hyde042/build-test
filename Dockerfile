# syntax=docker/dockerfile:1

## Build
FROM golang:1.19 AS build
RUN go build -o /build/server

## Deploy
FROM alpine:latest
COPY --from=build /build/server /server
ENTRYPOINT ["/server"]
