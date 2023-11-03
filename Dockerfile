FROM golang:1.21 as builder
WORKDIR /usr/src/app
COPY . .
RUN go build

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/go-image .
CMD ["./go-image"]