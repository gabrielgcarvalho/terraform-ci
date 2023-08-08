FROM alpine:3.18

# Install required packages
RUN apk update && apk add --no-cache \
    git \
    unzip \
    curl \
    ca-certificates \
    jq \
    python3 \
    py3-pip

# Install tflint
RUN curl -fsSL https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | sh

COPY entrypoint.sh /entrypoint.sh
COPY tflint-configs /tflint-configs
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]