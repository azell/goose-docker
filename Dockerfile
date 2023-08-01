FROM public.ecr.aws/docker/library/alpine:3.18.0
ARG TARGETPLATFORM
ARG GOOSE_VERSION=v3.14.0
ARG GOOSE_URL=https://github.com/pressly/goose/releases/download/${GOOSE_VERSION}/goose

USER nobody
WORKDIR /app
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN plat=$(echo "${TARGETPLATFORM}" | sed -e "s%amd64%x86_64%" -e "s%/%_%g") \
    && wget -q -O goose "${GOOSE_URL}_${plat}" \
    && chmod +x goose

ENTRYPOINT ["/app/goose"]
