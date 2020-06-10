ARG ES_VERSION=7.7.0
FROM elasticsearch:${ES_VERSION}

ARG ES_IK_PACKAGE=https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.7.0/elasticsearch-analysis-ik-7.7.0.zip
ARG ES_IK_FOLDER_NAME=ik
ARG PLUGINS_PATH=/usr/share/elasticsearch/plugins
ARG ES_PINYIN_PACKAGE=https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v7.7.0/elasticsearch-analysis-pinyin-7.7.0.zip
ARG ES_PINYIN_FOLDER_NAME=pinyin

RUN echo ${PLUGINS_PATH}
RUN set -eux \
    && cd ${PLUGINS_PATH} \
    && mkdir ${ES_IK_FOLDER_NAME} \
    && cd ${ES_IK_FOLDER_NAME} \
    && curl -L -o ${ES_IK_FOLDER_NAME}.zip ${ES_IK_PACKAGE} \
    && unzip ${ES_IK_FOLDER_NAME}.zip;

RUN set -eux \
    && cd ${PLUGINS_PATH} \
    && mkdir ${ES_PINYIN_FOLDER_NAME} \
    && cd ${ES_PINYIN_FOLDER_NAME} \
    && curl -L -o ${ES_PINYIN_FOLDER_NAME}.zip ${ES_PINYIN_PACKAGE} \
    && unzip ${ES_PINYIN_FOLDER_NAME}.zip;

CMD ["elasticsearch"]