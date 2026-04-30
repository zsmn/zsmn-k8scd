FROM alpine:3.19
RUN apk add --no-cache git git-daemon lighttpd bash
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]