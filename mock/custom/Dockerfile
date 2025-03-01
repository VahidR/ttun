FROM golang:1.24.0-alpine3.21 AS builder
WORKDIR /mock-custom

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY main.go .
RUN go build -o app


FROM golang:1.24.0-alpine3.21 AS app
COPY --from=builder /mock-custom/app /mock-custom/app
ENTRYPOINT ["/mock-custom/app"]
