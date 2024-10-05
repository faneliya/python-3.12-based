FROM ubuntu:noble AS backend-compat-build
WORKDIR /
# default working shell
SHELL ["/bin/bash", "-e", "-o", "pipefail", "-c"]

# default python3 - 3.12.x 
RUN mkdir /app && \
    mkdir /app/code && \
    apt update -y && \
    echo 'END OF APT UPDATE'

RUN apt install -y --no-install-recommends  \
    openssh-client	\
    openssh-server	\
    openssh-sftp-server	\
    openssl

# COPY requirements.txt /app

RUN groupadd -g 9000 dev && \
    useradd -r -g dev -d /app/code dev && \
    chown dev:dev /app/code
RUN echo "dev:kepco123456/" | chpasswd
RUN echo "root:kepco123456/" | chpasswd

EXPOSE 22 8000 8080 

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir /run/sshd

CMD ["/sbin/sshd", "-D"]