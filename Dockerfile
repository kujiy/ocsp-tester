FROM alpine
RUN apk upgrade --update-cache --available && \
    apk add openssl coreutils && \
    rm -rf /var/cache/apk/*
COPY verify.sh /verify.sh
CMD /verify.sh
