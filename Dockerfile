FROM alpine
RUN apk upgrade --update-cache --available && \
    apk add openssl diffutils && \
    rm -rf /var/cache/apk/*
RUN mkdir /ocsp
COPY . /ocsp
CMD /ocsp/run.sh
