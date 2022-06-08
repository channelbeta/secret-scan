FROM python:3.10.5-alpine3.15

# hadolint ignore=DL3018
RUN apk add --no-cache git less openssh

COPY "requirements.txt" "/requirements.txt"
RUN pip install --no-cache-dir --requirement requirements.txt

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
