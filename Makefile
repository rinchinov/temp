
BUILD_NUMBER=$(shell git rev-list --count HEAD)
CI_BUILD_LABEL            ?= v$(BUILD_NUMBER)
CI_DOCKER_TESTS_IMAGE     ?= robot-image:$(CI_BUILD_LABEL)
CI_DOCKER_TESTS_IMAGE     ?= robot-cont
CI_RESULTS_DIR            ?= $(CURDIR)/results
CI_TEST_CASES_DIR         ?= $(CURDIR)/test_cases

TEST_DIR                  ?= test_directory


.PHONY: docker
docker:
	docker build -t $(CI_DOCKER_TESTS_IMAGE) -f Dockerfile .

.PHONY: tests
tests:
	docker run -it --name system_tests        \
	-v $(CI_RESULTS_DIR):/root/results        \
	-v $(CI_TEST_CASES_DIR):/root/test_cases  \
    $(CI_DOCKER_TESTS_IMAGE)                  \
    --variable=TEST_DIR:$(TEST_DIR)           \
    --log    /root/results/log.html           \
    --report /root/results/report.html        \
    --output /root/results/output.xml         \
    /root/test_cases
