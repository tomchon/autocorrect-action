FROM huacnlee/autocorrect:v2.10.0

RUN apk add --update nodejs yarn && \
  curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin

ADD ./entrypoint.sh /entrypoint.sh
RUN yarn config set prefix /root/.yarn && \
  yarn global add autocorrect-node@2.9.0

ENV PATH="/root/.yarn/bin:${PATH}"

ENTRYPOINT ["/entrypoint.sh"]
