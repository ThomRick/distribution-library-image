FROM alpine:3.4
RUN set -ex \
    && apk add --no-cache ca-certificates apache2-utils
COPY ./registry/registry /bin/registry
COPY ./registry/config-example.yml /etc/docker/registry/config.yml
VOLUME ["/var/lib/registry"]
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/etc/docker/registry/config.yml"]
