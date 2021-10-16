FROM alpine:3.12
ARG TARGETPLATFORM

RUN \
  apk update && \
  apk add \
    python3 \
    curl && \
  rm -rf /var/cache/apk/*

RUN mkdir -p /usr/local/bin
#RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/$(echo $TARGETPLATFORM|cut -d/ -f2)/kubectl" 
RUN curl -LO "https://dl.k8s.io/release/v1.22.2/bin/linux/$(echo $TARGETPLATFORM|cut -d/ -f2)/kubectl" 
RUN chmod +x ./kubectl 
RUN mv ./kubectl /usr/local/bin/kubectl

ENTRYPOINT ["/usr/local/bin/kubectl"]

