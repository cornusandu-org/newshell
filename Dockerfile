FROM debian:stable

RUN apt-get update && apt-get install -y nano && apt-get clean

RUN apt-get update && apt-get install -y sudo && apt-get clean

RUN apt-get update && apt-get install -y build-essential && apt-get clean

RUN apt-get update && apt-get install -y curl && apt-get clean

RUN apt-get update && apt-get install -y acl && apt-get clean

# Copy the wrapper script into the image
COPY entrypoint.sh .

# Ensure it is executable
RUN chmod +x entrypoint.sh

# Default command: open a Bash shell
ENTRYPOINT ["./entrypoint.sh"]

CMD ["/bin/bash"]
