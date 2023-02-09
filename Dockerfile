# syntax=docker/dockerfile:1

## Build
FROM golang:1.19 AS build
RUN go build -o /server

## Deploy
FROM alpine:latest
COPY --from=build /server /server
ENTRYPOINT ["/server"]
