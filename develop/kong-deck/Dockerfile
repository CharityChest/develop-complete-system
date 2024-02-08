FROM alpine:3.19

ARG LOGIN_FRONTEND_SERVICE_URL
ARG LOGIN_FRONTEND_ROUTE_HOST

RUN apk update && apk add --no-cache \
    curl \
    bash

RUN mkdir /deck

WORKDIR /deck

RUN curl -sL https://github.com/kong/deck/releases/download/v1.30.0/deck_1.30.0_linux_amd64.tar.gz -o /deck/deck.tar.gz
RUN tar -xf /deck/deck.tar.gz -C /tmp
RUN cp /tmp/deck /usr/local/bin/
RUN rm -rf /deck/deck.tar.gz

COPY ./kong.yaml /deck/kong.yaml

RUN cp /deck/kong.yaml /deck/kong.yaml.bak

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN cat /deck/kong.yaml \
    | sed 's|'__LOGIN_FRONTEND_SERVICE_URL__'|'${LOGIN_FRONTEND_SERVICE_URL}'|g' \
    | sed 's|'__LOGIN_FRONTEND_ROUTE_HOST__'|'${LOGIN_FRONTEND_ROUTE_HOST}'|g' \
    > /deck/kong.yaml

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.12.1/wait /wait
RUN chmod +x /wait

CMD [ "/entrypoint.sh" ]