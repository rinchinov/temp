*** Settings ***
Documentation    intervew example
Library          OperatingSystem

*** Test Cases ***
Directory shoud exits in /
    [Tags]    example
    Should Exist  /${TEST_DIR}  directory should exist
