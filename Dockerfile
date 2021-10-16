FROM alpine:3.12

RUN \
  apk update && \
  apk add \
    python3 \
    curl && \
  rm -rf /var/cache/apk/*

RUN mkdir -p /usr/local/bin
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" 
RUN chmod +x ./kubectl 
RUN mv ./kubectl /usr/local/bin/kubectl

ENTRYPOINT ["/usr/local/bin/kubectl"]

