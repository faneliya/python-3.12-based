#FROM ubuntu:noble-20240904.1 AS backend-compat-build
FROM nvidia/cuda:12.8.0-cudnn-devel-ubuntu24.04 AS gpu-support-dev
WORKDIR /
# default working shell
SHELL ["/bin/bash", "-e", "-o", "pipefail", "-c"]

# clean up apt temp
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update -y
RUN apt-get install -y locales

# supoort korean language
RUN apt-get install -y language-pack-ko
RUN locale-gen ko_KR.EUC-KR
RUN update-locale LANG=ko_KR.UTF-8 LC_MESSAGES=POSIX
ENV LANG=ko_KR.UTF-8

# default python3 - 3.12.x  
RUN mkdir /app && \
    mkdir /app/code && \
    mkdir /app/bin && \
    mkdir /app/lib && \
    mkdir /app/github && \
    mkdir /app/data && \
    mkdir /app/mnt  && \
    mkdir /app/etc && \
    mkdir /app/log && \
    apt update -y && \
    echo 'END OF APT UPDATE'
    
ARG DEBIAN_FRONTEND=noninteractive

RUN apt install -y --force-yes --no-install-recommends  \
    adduser \
    net-tools \
    openssh-client	\
    openssh-server	\
    openssl	\
    python3	\
    python3-dbus	\
    python3-dev	\
    python3-pip	\
    python3-pkg-resources	\
    python3-setuptools	\
    python3-wheel	\
    python3-cffi \
    python3-brotli \
    cmake \
    gcc \
    g++ \
    git \
    apt	

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN apt install -y --no-install-recommends  \
    adwaita-icon-theme	\
    alsa-topology-conf	\
    alsa-ucm-conf	\
    at-spi2-core	\
    base-files	\
    base-passwd	\
    bash	\
    binutils	\
    binutils-common	\
    binutils-x86-64-linux-gnu	\
    bsdutils	\
    build-essential	\
    bzip2	\
    ca-certificates	\
    ca-certificates-java	\
    cmake	\
    cmake-data	\
    coreutils	\
    cpp	\
    cpp-11	\
    curl	\
    dash	\
    dbus	\
    dbus-user-session	\
    dconf-gsettings-backend	\
    dconf-service	\
    debconf	\
    debianutils	\
    dh-elpa-helper	\
    diffutils	\
    dirmngr	\
    distro-info-data	\
    dmsetup	\
    dpkg	\
    dpkg-dev	\
    e2fsprogs	\
    emacsen-common	\
    fakeroot	\
    findutils	\
    fontconfig	\
    fontconfig-config	\
    fonts-dejavu-core	\
    fonts-dejavu-extra	\
    g++-11	\
    gcc-11	\
    gcc-11-base	\
    gcc-12-base	\
    gir1.2-glib-2.0 \
    git-man	\
    gnupg	\
    gnupg-l10n	\
    gnupg-utils	\
    gpg	\
    gpg-agent	\
    gpgconf	\
    gpgsm	\
    gpgv	\
    gpg-wks-client	\
    gpg-wks-server	\
    grep	\
    gsettings-desktop-schemas	\
    gtk-update-icon-cache	\
    gyp	\
    gzip	\
    hicolor-icon-theme	\
    hostname	\
    humanity-icon-theme	\
    icu-devtools	\
    init-system-helpers	\
    iproute2	\
    iputils-ping	\
    java-common	\
    javascript-common	\
    less	\
    libacl1	\
    libalgorithm-diff-perl	\
    libalgorithm-diff-xs-perl	\
    libalgorithm-merge-perl	\
    libapparmor1	\
    libapt-pkg6.0	\
    libarchive13	\
    libargon2-1	\
    libasan6	\
    libassuan0	\
    libasyncns0	\
    libatm1	\
    libatomic1	\
    libatspi2.0-0	\
    libattr1	\
    libaudit1	\
    libaudit-common	\
    libauthen-sasl-perl	\
    libavahi-client3	\
    libavahi-common3	\
    libavahi-common-data	\
    libbinutils\
    libblkid1	\
    libbrotli1	\
    libbsd0	\
    libbz2-1.0 \
    libc6	\
    libc6-dev	\
    libcairo2	\
    libcairo-gobject2	\
    libcap2	\
    libcap2-bin	\
    libcap-ng0	\
    libc-ares2	\
    libc-bin	\
    libcc1-0	\
    libc-dev-bin	\
    libc-devtools	\
    libclone-perl	\
    libcolord2	\
    libcom-err2	\
    libcrypt1	\
    libcrypt-dev	\
    libcryptsetup12	\
    libctf0	\
    libctf-nobfd0	\
    libcups2	\
    libcurl3-gnutls	\
    libcurl4	\
    libdata-dump-perl	\
    libdatrie1	\
    libdb5.3	\
    libdbus-1-3	\
    libdconf1	\
    libdebconfclient0	\
    libdeflate0	\
    libdevmapper1.02.1	\
    libdpkg-perl	\
    libdrm2	\
    libdrm-amdgpu1	\
    libdrm-common	\
    libdrm-intel1	\
    libdrm-nouveau2	\
    libdrm-radeon1	\
    libedit2 \
    libelf1	\
    libencode-locale-perl	\
    libepoxy0	\
    liberror-perl	\
    libevent-2.1-7	\
    libexpat1	\
    libexpat1-dev	\
    libext2fs2	\
    libfakeroot	\
    libffi8	\
    libffi-dev	\
    libfido2-1	\
    libfile-basedir-perl	\
    libfile-desktopentry-perl	\
    libfile-fcntllock-perl	\
    libfile-listing-perl	\
    libfile-mimeinfo-perl	\
    libfont-afm-perl	\
    libfontconfig1	\
    libfontenc1	\
    libfreetype6	\
    libfribidi0	\
    libgail18	\
    libgail-common	\
    libgcc-11-dev	\
    libgcc-s1	\
    libgcrypt20	\
    libgcrypt20-dev	\
    libgd3	\
    libgdbm6	\
    libgdbm-compat4	\
    libgdk-pixbuf-2.0-0	\
    libgdk-pixbuf2.0-bin	\
    libgdk-pixbuf2.0-common	\
    libgif7	\
    libgirepository-1.0-1	\
    libgl1	\
    libgl1-amber-dri	\
    libgl1-mesa-dri	\
    libglapi-mesa	\
    libglib2.0-0	\
    libglib2.0-data\
    libglvnd0	\
    libglx0	\
    libglx-mesa0	\
    libgmp10	\
    libgmp-dev	\
    libgmpxx4ldbl	\
    libgnutls28-dev	\
    libgnutls30	\
    libgnutls-dane0	\
    libgnutls-openssl27	\
    libgomp1	\
    libgpg-error0	\
    libgpg-error-dev	\
    libgpm2	\
    libgraphite2-3	\
    libgssapi-krb5-2	\
    libgtk2.0-0	\
    libgtk2.0-bin	\
    libgtk2.0-common	\
    libgtk-3-0	\
    libgtk-3-bin	\
    libgtk-3-common	\
    libgtkd-3-0	\
    libharfbuzz0b	\
    libhogweed6	\
    libhtml-format-perl	\
    libhtml-form-perl	\
    libhtml-parser-perl	\
    libhtml-tagset-perl	\
    libhtml-tree-perl	\
    libhttp-cookies-perl	\
    libhttp-daemon-perl	\
    libhttp-date-perl	\
    libhttp-message-perl	\
    libhttp-negotiate-perl	\
    libice6	\
    libice-dev	\
    libicu-dev	\
    libidn2-0	\
    libidn2-dev	\
    libio-html-perl	\
    libio-socket-ssl-perl	\
    libio-stringy-perl	\
    libip4tc2	\
    libipc-system-simple-perl	\
    libisl23	\
    libitm1	\
    libjbig0	\
    libjpeg8	\
    libjpeg-turbo8	\
    libjs-events	\
    libjs-highlight.js	\
    libjs-inherits	\
    libjs-is-typedarray	\
    libjs-jquery	\
    libjson-c5	\
    libjsoncpp25	\
    libjs-psl	\
    libjs-source-map	\
    libjs-sphinxdoc	\
    libjs-sprintf-js	\
    libjs-typedarray-to-buffer	\
    libjs-underscore	\
    libk5crypto3	\
    libkeyutils1	\
    libkmod2	\
    libkrb5-3	\
    libkrb5support0	\
    libksba8	\
    liblcms2-2	\
    libldap-common	\
    libllvm15	\
    liblocale-gettext-perl	\
    liblsan0	\
    liblwp-mediatypes-perl	\
    liblwp-protocol-https-perl	\
    liblz4-1	\
    liblzma5	\
    libmailtools-perl	\
    libmaxminddb0	\
    libmd0	\
    libmnl0	\
    libmount1	\
    libmpc3	\
    libmpfr6	\
    libncurses6	\
    libncursesw6	\
    libnet-dbus-perl	\
    libnet-http-perl	\
    libnet-smtp-ssl-perl	\
    libnet-ssleay-perl	\
    libnettle8	\
    libnghttp2-14\
    libnginx-mod-http-geoip2	\
    libnginx-mod-http-image-filter	\
    libnginx-mod-http-xslt-filter	\
    libnginx-mod-mail	\
    libnginx-mod-stream	\
    libnginx-mod-stream-geoip2	\
    libnode-dev	\
    libnotify4	\
    libnotify-bin	\
    libnpth0	\
    libnsl2	\
    libnsl-dev	\
    libnspr4	\
    libnspr4-dev	\
    libnss3	\
    libnss3-dev	\
    libnss-systemd	\
    libogg0	\
    libopus0	\
    libp11-kit0	\
    libp11-kit-dev	\
    libpam0g	\
    libpam-cap	\
    libpam-modules	\
    libpam-modules-bin	\
    libpam-runtime	\
    libpam-systemd	\
    libpango-1.0-0	\
    libpangocairo-1.0-0	\
    libpangoft2-1.0-0	\
    libpciaccess0	\
    libpcre2-8-0	\
    libpcre3	\
    libpcsclite1	\
    libpixman-1-0	\
    libpng16-16	\
    libpq5	\
    libpq-dev	\
    libpsl5	\
    libpthread-stubs0-dev	\
    libpulse0	\
    libpython3-dev	\
    libpython3-stdlib	\
    libquadmath0	\
    libreadline8	\
    librhash0	\
    librsvg2-2	\
    librsvg2-common	\
    librtmp1	\
    libsasl2-2	\
    libsasl2-dev	\
    libsasl2-modules	\
    libsasl2-modules-db	\
    libseccomp2	\
    libselinux1	\
    libsemanage2	\
    libsemanage-common	\
    libsensors5	\
    libsensors-config	\
    libsepol2	\
    libsm6	\
    libsmartcols1	\
    libsm-dev	\
    libsndfile1	\
    libsodium23	\
    libsqlite3-0	\
    libss2	\
    libssh-4	\
    libssl3	\
    libssl-dev	\
    libstdc++-11-dev	\
    libstdc++6	\
    libsystemd0	\
    libtasn1-6	\
    libtasn1-6-dev	\
    libtasn1-doc	\
    libtext-iconv-perl	\
    libthai0	\
    libthai-data	\
    libtie-ixhash-perl	\
    libtimedate-perl	\
    libtinfo6	\
    libtirpc3	\
    libtirpc-common	\
    libtirpc-dev	\
    libtry-tiny-perl	\
    libtsan0	\
    libubsan1	\
    libudev1	\
    libunbound8	\
    libunwind8	\
    liburi-perl	\
    libuuid1	\
    libuv1	\
    libuv1-dev	\
    libvorbis0a	\
    libvorbisenc2	\
    libvte-2.91-0	\
    libvte-2.91-common	\
    libvted-3-0	\
    libwayland-client0	\
    libwayland-cursor0	\
    libwayland-egl1	\
    libwebp7	\
    libwrap0	\
    libwww-perl	\
    libwww-robotrules-perl	\
    libx11-6	\
    libx11-data	\
    libx11-dev	\
    libx11-protocol-perl	\
    libx11-xcb1\
    libxau6	\
    libxau-dev	\
    libxaw7	\
    libxcb1	\
    libxcb1-dev	\
    libxcb-dri2-0	\
    libxcb-dri3-0	\
    libxcb-glx0	\
    libxcb-present0	\
    libxcb-randr0	\
    libxcb-render0	\
    libxcb-shape0	\
    libxcb-shm0	\
    libxcb-sync1	\
    libxcb-xfixes0	\
    libxcomposite1	\
    libxcursor1	\
    libxdamage1	\
    libxdmcp6	\
    libxdmcp-dev	\
    libxext6	\
    libxfixes3	\
    libxft2	\
    libxi6	\
    libxinerama1	\
    libxkbcommon0	\
    libxkbfile1	\
    libxml2	\
    libxml2-dev	\
    libxml-parser-perl	\
    libxmlsec1	\
    libxmlsec1-dev	\
    libxmlsec1-gcrypt	\
    libxmlsec1-gnutls	\
    libxmlsec1-nss	\
    libxmlsec1-openssl	\
    libxml-twig-perl	\
    libxml-xpathengine-perl	\
    libxmu6	\
    libxmuu1	\
    libxpm4	\
    libxrandr2	\
    libxrender1	\
    libxshmfence1	\
    libxslt1.1	\
    libxslt1-dev	\
    libxt6	\
    libxtables12	\
    libxt-dev	\
    libxtst6	\
    libxv1	\
    libxxf86dga1	\
    libxxf86vm1	\
    libxxhash0	\
    libzstd1	\
    linux-libc-dev	\
    login	\
    logsave	\
    lsb-base	\
    lsb-release	\
    lto-disabled-list	\
    make	\
    manpages	\
    manpages-dev	\
    mawk	\
    media-types	\
    mount	\
    ncurses-base	\
    ncurses-bin	\
    ncurses-term	\
    netbase	\
    nettle-dev	\
    networkd-dispatcher	\
    nginx	\
    nginx-common	\
    nginx-core\
    node-abab	\
    node-abbrev	\
    node-agent-base	\
    node-ansi-regex	\
    node-ansistyles	\
    node-ansi-styles	\
    node-aproba	\
    node-archy	\
    node-are-we-there-yet	\
    node-argparse	\
    node-arrify	\
    node-asap	\
    node-asynckit	\
    node-balanced-match	\
    node-brace-expansion	\
    node-builtins	\
    node-cacache	\
    node-chalk	\
    node-chownr	\
    node-clean-yaml-object	\
    node-cli-table	\
    node-clone	\
    node-color-convert	\
    node-color-name	\
    node-colors	\
    node-columnify	\
    node-combined-stream	\
    node-commander	\
    node-console-control-strings	\
    node-copy-concurrently	\
    node-core-util-is	\
    node-coveralls	\
    node-cssom	\
    node-cssstyle	\
    node-debug	\
    node-decompress-response	\
    node-defaults	\
    node-delayed-stream	\
    node-delegates	\
    node-depd	\
    node-diff	\
    node-encoding	\
    node-end-of-stream	\
    node-err-code	\
    node-escape-string-regexp	\
    node-esprima	\
    node-events	\
    node-fancy-log	\
    node-fetch	\
    node-foreground-child	\
    node-form-data	\
    node-fs.realpath	\
    node-fs-write-stream-atomic	\
    node-function-bind	\
    node-gauge	\
    node-get-stream	\
    node-got	\
    node-graceful-fs	\
    node-growl	\
    node-gyp	\
    node-has-flag	\
    node-has-unicode	\
    node-hosted-git-info	\
    node-https-proxy-agent	\
    node-iconv-lite	\
    node-iferr	\
    node-imurmurhash	\
    node-indent-string	\
    node-inflight	\
    node-inherits	\
    node-ini	\
    node-ip	\
    node-ip-regex	\
    node-isarray	\
    node-is-buffer	\
    node-isexe	\
    node-is-plain-obj	\
    node-is-typedarray	\
    nodejs	\
    nodejs-doc	\
    node-jsdom	\
    node-json-buffer	\
    node-jsonparse	\
    node-json-parse-better-errors	\
    node-js-yaml	\
    node-kind-of	\
    node-lcov-parse	\
    node-lodash-packages	\
    node-log-driver	\
    node-lowercase-keys	\
    node-lru-cache	\
    node-mime	\
    node-mime-types	\
    node-mimic-response	\
    node-minimatch	\
    node-minimist	\
    node-minipass	\
    node-mkdirp	\
    node-move-concurrently	\
    node-ms	\
    node-mute-stream	\
    node-negotiator	\
    node-nopt	\
    node-normalize-package-data	\
    node-npm-bundled	\
    node-npmlog	\
    node-npm-package-arg	\
    node-object-assign	\
    node-once	\
    node-opener	\
    node-osenv	\
    node-path-is-absolute	\
    node-p-cancelable	\
    node-p-map	\
    node-process-nextick-args	\
    node-promise-inflight	\
    node-promise-retry	\
    node-promzard	\
    node-psl	\
    node-pump	\
    node-punycode	\
    node-quick-lru	\
    node-read	\
    node-readable-stream	\
    node-read-package-json	\
    node-resolve	\
    node-retry	\
    node-rimraf	\
    node-run-queue	\
    node-safe-buffer	\
    node-semver	\
    node-set-blocking	\
    node-signal-exit	\
    node-slash	\
    node-slice-ansi	\
    node-source-map	\
    node-source-map-support	\
    node-spdx-correct	\
    node-spdx-exceptions	\
    node-spdx-expression-parse	\
    node-spdx-license-ids	\
    node-sprintf-js\
    node-ssri	\
    node-stack-utils	\
    node-stealthy-require	\
    node-string-decoder	\
    node-string-width	\
    node-strip-ansi	\
    node-supports-color	\
    node-tap	\
    node-tap-mocha-reporter	\
    node-tap-parser	\
    node-tar	\
    node-text-table	\
    node-time-stamp	\
    node-tmatch	\
    node-tough-cookie	\
    node-typedarray-to-buffer	\
    node-unique-filename	\
    node-universalify	\
    node-util-deprecate	\
    node-validate-npm-package-license	\
    node-validate-npm-package-name	\
    node-wcwidth.js	\
    node-webidl-conversions	\
    node-whatwg-fetch	\
    node-which	\
    node-wide-align	\
    node-wrappy	\
    node-write-file-atomic	\
    node-ws	\
    node-yallist \
    npm	\
    openjdk-8-jdk	\
    openjdk-8-jre	\
    openssh-sftp-server	\
    passwd	\
    patch	\
    perl	\
    perl-base	\
    perl-openssl-defaults	\
    pinentry-curses	\
    pkg-config	\
    procps	\
    publicsuffix	\
    readline-common	\
    rpcsvc-proto	\
    sed	\
    sensible-utils	\
    session-migration	\
    shared-mime-info	\
    ssh-import-id	\
    systemd	\
    systemd-sysv	\
    systemd-timesyncd	\
    sysvinit-utils	\
    tar	\
    telnet	\
    tilix	\
    tilix-common	\
    traceroute	\
    ubuntu-keyring	\
    ubuntu-mono	\
    ucf	\
    util-linux	\
    vim	\
    vim-common	\
    vim-runtime	\
    wget	\
    x11-common	\
    x11proto-dev	\
    x11-utils	\
    x11-xserver-utils	\
    xauth	\
    xdg-user-dirs	\
    xdg-utils	\
    xkb-data	\
    xorg-sgml-doctools	\
    xtrans-dev	\
    xxd	\
    xz-utils	\
    zip \
    zlib1g	\
    zlib1g-dev	\
    libgtk-3-dev gobject-introspection gobject-introspection-bin 
    #    too big , reserved for vowpalwabbit
    #    libboost-all-dev \

RUN apt-get -y install tensorrt

# clear package conflict before pip installation
RUN python3 -m pip config set global.break-system-packages true

# install applications
WORKDIR /
# update version 1.2.0 - 1.2.
RUN pip3 install jupyter
# ollomba
RUN curl -fsSL https://ollama.com/install.sh | sh


# install python development environment packages
COPY requirements.txt /app/etc
#RUN pip3 install --no-cache-dir --ignore-installed -r /app/etc/requirements.txt
RUN pip3 install --no-cache-dir --no-deps --disable-pip-version-check -I -r /app/etc/requirements.txt

# for application setting ######################################################
COPY scripts/*.sh /app/bin
RUN chmod 755 /app/bin/*.sh

# install practice codes
WORKDIR /app/github/
RUN git clone https://github.com/rickiepark/ml-with-pytorch.git
RUN git clone https://github.com/rickiepark/handson-ml3.git
RUN git clone https://github.com/ollama/ollama.git

# https://github.com/nvidia-cosmos/cosmos-predict1.git
# https://github.com/nvidia-cosmos/cosmos-predict2.git
# https://github.com/nvidia-cosmos/cosmos-reason1.git

RUN groupadd -g 9000 dev && \
    mkdir /home/dev-fastapi && \
    mkdir /home/dev-django && \
    mkdir /home/dev-react && \
    cp /root/.bashrc /app/code/ && \
    cp /root/.bashrc /home/dev-fastapi/ && \
    cp /root/.bashrc /home/dev-django/ && \
    cp /root/.bashrc /home/dev-react/ && \
    useradd -r -g dev -d /app/code dev && \
    useradd -r -g dev -d /home/dev-fastapi dev-fastapi && \
    useradd -r -g dev -d /home/dev-django dev-django && \
    useradd -r -g dev -d /home/dev-react dev-react && \
    chown -R dev:dev /app/code && \
    chown -R dev-fastapi:dev /home/dev-fastapi && \
    chown -R dev-django:dev /home/dev-django && \
    chown -R dev-react:dev /home/dev-react

RUN echo "dev:kepco123456/" | chpasswd &&\
    echo "root:kepco123456/" | chpasswd &&\
    echo "dev-fastapi:kepco123456/" | chpasswd &&\
    echo "dev-django:kepco123456/" | chpasswd &&\
    echo "dev-react:kepco123456/" | chpasswd

# RUN npm i -g npm-check-updates &&\
#     ncu -u &&\
#     npm install --force or --legacy-peer-deps

# PORT EXPOSE ##################################################################
# ssh
EXPOSE 22
# http
EXPOSE 80
# django or react something 
EXPOSE 3000
# flask 
EXPOSE 5000
# http tomcat etc
EXPOSE 8000 
# http tomcat
EXPOSE 8040 
# http application
EXPOSE 8080 
# http extra
EXPOSE 8090
# jupyter
EXPOSE 9080 

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# ubuntu:noble docker version directory missing bug must be fixed below 
RUN mkdir /run/sshd

CMD ["/sbin/sshd", "-D"]