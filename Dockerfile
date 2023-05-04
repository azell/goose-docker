FROM public.ecr.aws/docker/library/alpine:3.17.3
ARG TARGETPLATFORM
ARG GOOSE_VERSION=v3.10.0
ARG GOOSE_URL=https://github.com/pressly/goose/releases/download/${GOOSE_VERSION}/goose

USER nobody
WORKDIR /app
RUN arch=$(echo "${TARGETPLATFORM}" | sed -e "s%amd64%x86_64%" -e "s%/%_%g") \
    && wget -O goose "${GOOSE_URL}_${arch}" \
    && chmod +x goose

ENTRYPOINT ["/app/goose"]
