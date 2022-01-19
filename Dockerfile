FROM python:3.11.0a4-alpine3.15

# hadolint ignore=DL3013,DL3018
RUN pip install --no-cache-dir truffleHog && \
    apk add --no-cache git less openssh

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
