FROM alpine:3.7
ADD sample.sh /
RUN apk add --update bash && rm -rf /var/cache/apk/*
CMD ["/bin/bash", "/sample.sh"]
