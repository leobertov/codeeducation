FROM golang:1.13.1-alpine3.10 as builder


WORKDIR $GOPATH/src/leoberto/golang-codeeducation-rocks/
COPY ./code/main.go .

RUN go build -ldflags="-s -w" -o /go/app

FROM scratch

COPY --from=builder /go/app /go/app

CMD ["/go/app"]