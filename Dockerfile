FROM golang:1.24.0-alpine3.21 AS builder
RUN apk add --no-cache build-base
WORKDIR /ttun

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY main.go .
ARG race
RUN if [[ -z "$race" ]] ; then CGO_ENABLED=0 go build -o app ; else CGO_ENABLED=1 go build -o app -race ; fi


FROM golang:1.24.0-alpine3.21 AS app
COPY --from=builder /ttun/app /ttun/app
ENTRYPOINT ["/ttun/app"]
