*** Settings ***
Resource    ${CURDIR}/../resource/import_api.robot
*** Test Case ***
TC001 Verify http status code
       ${request}=    Post request api     ${request_data_no.6}
       Verify http status code      ${request}       201

TC002 Verify response header
       ${request}=    Post request api     ${request_data_no.6}
       Verify response header          ${request.headers}      ${request.headers}
       log    ${request.headers}

TC003 Verify response match with request
       ${request}=    Post request api     ${request_data_no.6}
       Verify response match with request      ${request.json()['info']}      ${request_data_no.6}[info]


