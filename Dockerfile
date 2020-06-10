ARG ES_VERSION=2.4.3
FROM elasticsearch:${ES_VERSION}

ARG ES_IK_PACKAGE=https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v1.10.3/elasticsearch-analysis-ik-1.10.3.zip
ARG ES_IK_FOLDER_NAME=ik
ARG PLUGINS_PATH=/usr/share/elasticsearch/plugins
ARG ES_PINYIN_PACKAGE=https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v1.8.3/elasticsearch-analysis-pinyin-1.8.3.zip
ARG ES_PINYIN_FOLDER_NAME=pinyin

RUN echo ${PLUGINS_PATH}
RUN set -eux \
    && cd ${PLUGINS_PATH} \
    && mkdir ${ES_IK_FOLDER_NAME} \
    && cd ${ES_IK_FOLDER_NAME} \
    && wget ${ES_IK_PACKAGE} -O ${ES_IK_FOLDER_NAME}.zip \
    && unzip ${ES_IK_FOLDER_NAME}.zip;

RUN set -eux \
    && cd ${PLUGINS_PATH} \
    && mkdir ${ES_PINYIN_FOLDER_NAME} \
    && cd ${ES_PINYIN_FOLDER_NAME} \
    && wget ${ES_PINYIN_PACKAGE} -O ${ES_PINYIN_FOLDER_NAME}.zip \
    && unzip ${ES_PINYIN_FOLDER_NAME}.zip;

CMD ["elasticsearch"]