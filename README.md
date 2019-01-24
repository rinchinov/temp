# Robot framework
Robot framework

Build docker image:
* Robot framework image `make docker`

Run tests:
* Run your custom robot test cases `make tests`
** parameters: 
    `CI_DOCKER_TESTS_IMAGE`  -- name of docker image
    `CI_RESULTS_DIR`         -- directory for results
    `CI_TEST_CASES_DIR`      -- directory with test cases
    `TEST_DIR`               -- variable for test condition
