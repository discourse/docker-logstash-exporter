FROM golang:1.13 as golang

RUN go get -d github.com/discourse/prometheus-logstash-exporter && \
    cd $GOPATH/src/github.com/discourse/prometheus-logstash-exporter && \
    go build

FROM busybox:1.27.2-glibc
COPY --from=golang /go/src/github.com/discourse/prometheus-logstash-exporter/prometheus-logstash-exporter /
EXPOSE 9304
ENTRYPOINT ["/prometheus-logstash-exporter"]
