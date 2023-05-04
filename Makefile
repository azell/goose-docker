IMAGE    := public.ecr.aws/s4b2s5g7/goose
PLATFORM := linux/amd64,linux/arm64
VERSION  := v3.10.0

.DEFAULT: build
.PHONY: build create

build: create
	docker buildx build --push --platform $(PLATFORM) --tag $(IMAGE):$(VERSION) .

create:
	docker buildx inspect multiarch > /dev/null || docker buildx create --name multiarch --use
