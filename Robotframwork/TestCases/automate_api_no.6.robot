*** Settings ***
Resource    ${CURDIR}/../resource/import_api.robot
*** Test Case ***
TC001 Verify response api method post
       ${request}=    Post request api     ${request_data_no.6}
       Verify http status code      ${request}       201
       Verify response header          ${request.headers}      ${request.headers}
       Verify response match with request      ${request.json()['info']}      ${request_data_no.6}[info]


