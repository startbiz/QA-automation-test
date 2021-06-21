
*** Keywords ***
Verify http status code
    [Documentation]    Verify http status code, By send response and expected code
    [Arguments]    ${response}    ${expected_code}
    ${http_code}=    Set Variable    ${response.status_code}
    ${expected_code}=    Convert To Integer    ${expected_code}
    Should Be Equal    ${http_code}    ${expected_code}

Get request api
    Create Session  test   ${request_host}
    ${api response}=   Get Request    test      /users
    Verify http status code    ${api response}    200
    [Return]    ${api response.json()}

Post request api
    [Arguments]     ${body}
    Create Session  test    ${request_host}
    ${headers}=     Create Dictionary   Content-Type=${headers}[Content-Type]
    ${api response}=   Post Request    test      /posts       headers=${headers}    data=${body}
     [Return]      ${api response}

Verify response header
     [Arguments]     ${body}     ${expected}
     should be equal      ${body}     ${expected}

Verify response match with request
     [Arguments]     ${body}     ${expected}
     Should be equal     ${body}     ${expected}


Verify response body is not empty
    [Documentation]    response is json type, body
    [Arguments]    ${body}
     should not be empty       ${body}       ${expected}

Verify response id should not be null
    [Documentation]    response is json type, body
    [Arguments]    ${body}
    should not be equal     ${body}[0][id]    ${NULL}

Verify lenght response body
     [Arguments]       ${body}     ${lenght}
     ${range}=   GET LENGTH     ${body}
     should be equal       ${range}       ${lenght}

Verify response type
     [Arguments]       ${body}       ${expected}
     should be equal      ${body}    ${expected}

Verify data type id
    [Documentation]    Verify data type id should be integer type
    [Arguments]       ${body}    ${expected}
     ${range}=   GET LENGTH     ${body}
     FOR   ${item}   IN RANGE  ${range}
           ${body_id}      Evaluate    type(${body}[${item}][id])
           ${expected_id}     Evaluate    type(${expected}[0][id])
           should be equal     ${body_id}     ${expected_id}
           Exit For Loop IF     "${body_id}" == "${expected_id}"
     END

Verify data type name
    [Documentation]    Verify data type id should be string type
    [Arguments]       ${body}   ${expected_name}
     ${range}=   GET LENGTH     ${body}
     FOR   ${item}   IN RANGE  ${range}
           ${string_body}=  Set Variable  ${body}[${item}][name]
           ${body_name}    evaluate     type($string_body)
           ${string_expected}=  Set Variable  ${expected}[0][name]
           ${expected_name}     Evaluate    type($string_expected)
           should be equal     ${body_name}     ${expected_name}
           Exit For Loop IF     "${body_name}" == "${expected_name}"
     END