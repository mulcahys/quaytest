FROM python:2.7-slim

LABEL version="v0.0.0"
LABEL description="quay test"

RUN apt-get update && apt-get install -y --no-install-recommends \
        coreutils \
        curl \
        busybox-static \
        git \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/spool/cron/crontabs
COPY crontab /root/crontab
RUN /bin/busybox crontab -u root /root/crontab
CMD ["/bin/busybox", "crond", "-f", "-L", "/dev/stdout"]
