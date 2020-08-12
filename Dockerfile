#------------------------------------------------------------------------------
# Portions of this file are Copyright (C)2020 Robert Cowart
# 
# Portions of this file are subject to the Robert Cowart Public License (the
# "License") and may not be used or distributed except in compliance with the
# License. You may obtain a copy of the License at:
# 
# http://www.koiossian.com/public/robert_cowart_public_license.txt
# 
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
# the specific language governing rights and limitations under the License.
# 
# The Original Source Code was developed by Robert Cowart. Portions created by
# Robert Cowart are Copyright (C)2020 Robert Cowart. All Rights Reserved.
#------------------------------------------------------------------------------

FROM docker.elastic.co/logstash/logstash:7.8.1

ARG BUILD_DATE

LABEL org.opencontainers.image.created="$BUILD_DATE" \
      org.opencontainers.image.authors="elastiflow@gmail.com" \
      org.opencontainers.image.url="https://github.com/robcowart/elastiflow/README.md" \
      org.opencontainers.image.documentation="https://github.com/robcowart/elastiflow/DOCKER.md" \
      org.opencontainers.image.source="https://github.com/robcowart/elastiflow" \
      org.opencontainers.image.version="4.0.1" \
      org.opencontainers.image.vendor="Robert Cowart" \
      org.opencontainers.image.title="ElastiFlow™ - Logstash" \
      org.opencontainers.image.description="Logstash with the ElastiFlow™ pipeline."

ENV ELASTIFLOW_ES_HOST="http://127.0.0.1:9200"

RUN $HOME/bin/logstash-plugin install logstash-codec-sflow \
    && $HOME/bin/logstash-plugin update

WORKDIR /usr/share/logstash/config
COPY --chown=logstash:logstash ./docker_assets/logstash.yml ./
COPY --chown=logstash:logstash ./docker_assets/pipelines.yml ./

WORKDIR /etc/logstash/elastiflow
COPY --chown=logstash:root ./logstash/elastiflow/ ./

ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]
