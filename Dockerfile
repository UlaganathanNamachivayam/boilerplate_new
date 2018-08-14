FROM alpine:3.7
ADD Sample.sh /
RUN apk add --update bash && rm -rf /var/cache/apk/*
CMD ["/bin/bash", "/Sample.sh"]
