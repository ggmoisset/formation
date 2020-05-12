ARG version=latest
FROM ubuntu:$version
#MAINTAINER JCD "jcd717@outlook.com"

LABEL maintainer="GGM <gerar.moisset@orange.com>" \
      description="test" \
      auteur="gerard moisset" \
      clef_label="valeurDuLabel"

COPY heartbeat.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh ; \
    echo coucou >test.txt

ARG hbs=3
ENV HEARTBEATSTEP $hbs


# information de port réseau utile via docker inspect
EXPOSE 1234/udp 4321/tcp
# cmde a executer lors du docker run
ENTRYPOINT ["/entrypoint.sh"]
# arg de la cmde ENTRYPOINT, CMD est un arg

CMD ["battement"]

# ou..
# CMD /entrypoint.sh battement
# CMD [ "/entrypoint.sh" , "battement" ]

