FROM alpine:3.7
RUN apk add --update bash && rm -rf /var/cache/apk/*
CMD ["/bin/bash", "echo hello world"]
