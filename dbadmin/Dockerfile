FROM dpage/pgadmin4

COPY config_local.py /pgadmin4
ENV TZ=UTC
USER root
RUN apk add tzdata