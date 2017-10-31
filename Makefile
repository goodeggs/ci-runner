.PHONY: all release clean build

ORG=goodeggs
PROJECT=ci-runner

all: build

release: build
	@sleep 1 # Need a bit of sleep so docker has a moment to complete
	docker push $(ORG)/$(PROJECT)

clean:
	@docker rmi -f $(ORG)/$(PROJECT) . >/dev/null 2>&1 || true

build: clean
	@echo 'Starting build....'
	@docker build --squash -f dist/Dockerfile -t $(ORG)/$(PROJECT) . | sed 's/^/[docker build] /'
	@echo ''
	@echo '******************************************  Layer Info  ***************************************'
	@docker history $(ORG)/$(PROJECT)
	@echo ''
	@echo '******************************************  Image Size  ***************************************'
	@docker images $(ORG)/$(PROJECT)
	@echo ''
	@echo '***********************************************************************************************'
