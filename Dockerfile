FROM debian:stable

ARG MINIMAL=false

# Dependencies are split between two RUN commands to increase caching frequency during development
RUN apt-get update && \
    apt-get install -y \
        nano \
        sudo \
        build-essential \
        curl \
        p7zip \
        unrar-free \
        mandoc \
        grep \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN if [ "$MINIMAL" = "false" ]; then \ 
apt-get update && \
    apt-get install -y \
        nmap \
        tcpdump \
        antlr4 \
        antlr4-doc \
        basex \
        basez \
        bashtop \
        bash-doc \
        bash-completion \
        acl \
        bash-argsparse \
        basix-doc \
        p7zip-full \
        7kaa \
        catdoc \
        ddnet \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* ; \
else \
    echo "[-] Making minimal build" ; \
fi

# Copy the wrapper script into the image
COPY entrypoint.sh .

# Ensure it is executable
RUN chmod +x entrypoint.sh

# Default command: open a Bash shell
ENTRYPOINT ["./entrypoint.sh"]

CMD ["/bin/bash"]
