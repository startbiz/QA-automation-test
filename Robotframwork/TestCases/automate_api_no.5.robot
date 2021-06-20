*** Settings ***
Resource    ${CURDIR}/../resource/import_api.robot

*** Test Case ***
TC001 Verify response body is not empty
      ${resp}=      Get request api
      Verify response body is not empty        ${resp}

TC002 Verify response id should not be null
       ${resp}=      Get request api
      Verify response id should not be null      ${resp}

TC003 Verify lenght response body
      ${resp}=      Get request api
      Verify lenght response body    ${resp}    ${expected_lenght_size}

TC004 Verify data type id
       ${resp}=      Get request api
      Verify data type id      ${resp}    ${expected}

TC005 Verify data type name
       ${resp}=      Get request api
      Verify data type name      ${resp}    ${expected}
