# docker image for telemetry agent

DOCKER_TELEMETRY = docker-sonic-telemetry.gz
$(DOCKER_TELEMETRY)_PATH = $(DOCKERS_PATH)/docker-sonic-telemetry
$(DOCKER_TELEMETRY)_DEPENDS += $(REDIS_TOOLS) $(SONIC_TELEMETRY)
$(DOCKER_TELEMETRY)_LOAD_DOCKERS += $(DOCKER_CONFIG_ENGINE_STRETCH)
SONIC_DOCKER_IMAGES += $(DOCKER_TELEMETRY)
ifeq ($(ENABLE_SYSTEM_TELEMETRY), y)
SONIC_INSTALL_DOCKER_IMAGES += $(DOCKER_TELEMETRY)
SONIC_STRETCH_DOCKERS += $(DOCKER_TELEMETRY)
endif

$(DOCKER_TELEMETRY)_CONTAINER_NAME = telemetry
$(DOCKER_TELEMETRY)_RUN_OPT += --net=host --privileged -t
$(DOCKER_TELEMETRY)_RUN_OPT += -v /etc/sonic:/etc/sonic:ro

