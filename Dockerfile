FROM ubuntu:20.04

RUN  apt-get update && \
            apt-get clean && \
            apt-get install -f && \
            DEBIAN_FRONTEND=noninteractive \
                    apt-get install -y \
                    python3 \
                    python3-uno unoconv \
                    poppler-utils \
                    wget \
                    software-properties-common

RUN apt-get update && apt-get clean


# Remove the packages that are no longer required after the package has been installed
RUN DEBIAN_FRONTEND=noninteractive apt-get autoremove --purge -q -y
RUN DEBIAN_FRONTEND=noninteractive apt-get autoclean -y -q
RUN DEBIAN_FRONTEND=noninteractive apt-get clean -y

# Remove all non-required information from the system to have the smallest
# image size as possible
RUN rm -rf /usr/share/doc/* /usr/share/man/?? /usr/share/man/??_* /usr/share/locale/* /var/cache/debconf/*-old /var/lib/apt/lists/* /tmp/*
