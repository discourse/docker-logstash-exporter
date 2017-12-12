FROM golang:1.9 as golang

RUN go get -u github.com/tgxworld/prometheus-logstash-exporter && \
    cd $GOPATH/src/github.com/tgxworld/prometheus-logstash-exporter && \
    go build

FROM busybox:1.27.2-glibc
COPY --from=golang /go/src/github.com/tgxworld/prometheus-logstash-exporter/prometheus-logstash-exporter /
EXPOSE 9304
ENTRYPOINT ["/prometheus-logstash-exporter"]
