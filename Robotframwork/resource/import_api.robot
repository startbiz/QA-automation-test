*** Settings ***
Library      RequestsLibrary
Library      JSONLibrary
Library      Collections
Library      String
Library      json
Library      yaml

Resource      ${CURDIR}/../Keywords/api_keywords.robot
Variables     ${CURDIR}/../resource/api_data_no.5/data_api_no.5.yaml
Variables     ${CURDIR}/../resource/api_request.yaml
Variables      ${CURDIR}/../resource/api_data_no.5/data_api_expected_no.5.yaml
Variables      ${CURDIR}/../resource/api_data_no.6/data_api_no.6.yaml
Variables      ${CURDIR}/../resource/api_data_no.6/data_api_expected_no.6.yaml
