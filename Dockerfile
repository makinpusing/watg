# IMAGE
FROM golang:1-alpine

# DEPENDENCIES
RUN apk update \
    ; apk add --no-cache \
              go \
              git \
              gcc \
              g++ \
              make \
              libwebp-dev \
              libwebp-tools \
              ffmpeg \
              imagemagick

# CLONE REPO    
RUN git clone \
        https://github.com/ilhamsrc/watg \
                /go/src/watgbridge \
    ; chmod 777 /go/src/watgbridge

# COPY CONFIG
COPY config.yaml *db /go/src/watgbridge/

# SET WORKDIR
WORKDIR /go/src/watgbridge

# BUILD
RUN go build

# RUN
CMD ["./watgbridge"]
