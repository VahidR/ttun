FROM alpine:3.21
COPY target/ttun /ttun
ENTRYPOINT ["/ttun"]
