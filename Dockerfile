FROM java:8-jre
MAINTAINER Joway Wang <joway.w@gmail.com> 

ENV ES_VERSION="2.2.1"
ENV ES_DIR=/usr/share/elasticsearch
ENV PATH ${ES_DIR}/bin:$PATH


RUN mkdir ${ES_DIR}
    # for path in data config logs config/scripts; do mkdir -p "${ES_DIR}/$path"; done

ADD . ${ES_DIR}

# start elastic as es
RUN groupadd es && \
    useradd -g es es && \
    chown -R es:es ${ES_DIR}
USER es


WORKDIR ${ES_DIR}

VOLUME ${ES_DIR}/data
VOLUME ${ES_DIR}/logs

EXPOSE 9200 9300

CMD ["./bin/elasticsearch"]
