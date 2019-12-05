FROM alpine:3.10

LABEL version="1.1.0"
LABEL maintainer="Pendect Tech Team <tech@pendect.com>" \
      org.label-schema.vendor="Pendect GmbH" \
      com.github.actions.name="RSyncer Action" \
      com.github.actions.description="This action syncs files (probably) generated by a previous step in the workflow with a remote server." \
      com.github.actions.icon="truck" \
      com.github.actions.color="blue"

RUN apk add --no-cache --virtual .run-deps rsync=3.1.3-r1 openssh=8.1_p1-r0 && \
    rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
