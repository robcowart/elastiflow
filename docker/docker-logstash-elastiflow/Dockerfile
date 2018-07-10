ARG VERSION=6.0.0
FROM docker.elastic.co/logstash/logstash:$VERSION

MAINTAINER A. Fressancourt <antoine.fressancourt@gmail.com> 

RUN $HOME/bin/logstash-plugin install logstash-codec-sflow
RUN $HOME/bin/logstash-plugin update logstash-codec-netflow
RUN $HOME/bin/logstash-plugin update logstash-input-udp
RUN $HOME/bin/logstash-plugin update logstash-filter-dns

EXPOSE 9600 5044

ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]
