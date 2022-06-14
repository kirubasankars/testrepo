FROM busybox:latest
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
VOLUME ["/tmp"]
ENTRYPOINT ["/entrypoint.sh"]

#docker exec -it tmptest sh
#docker exec -it tmptest find /tmp -name 't.txt'
