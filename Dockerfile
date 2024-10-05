FROM ubuntu:noble AS backend-compat-build
WORKDIR /
# default working shell
SHELL ["/bin/bash", "-e", "-o", "pipefail", "-c"]

RUN mkdir /app && \
    apt update -y && \
# default python3 - 3.12.x 
# her is problme
    apt-get install python3 python3-dev python3-pip &&\
    echo 'END OF INSTALL PYTHON3 INTERPRETER'

# add python default id - dev:dev
RUN groupadd -g 1000 posthog && \
    useradd -r -g posthog posthog && \
    chown posthog:posthog /code
USER posthog


EXPOSE 22 8000 8080 

# Setup ENV.
ENV NODE_ENV=production \
    CHROME_BIN=/usr/bin/chromium \
    CHROME_PATH=/usr/lib/chromium/ \
    CHROMEDRIVER_BIN=/usr/bin/chromedriver

# Expose the port from which we serve OpenMetrics data.

USER root
CMD ["./bin/docker"]