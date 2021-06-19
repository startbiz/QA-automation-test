*** Settings ***
Resource    ${CURDIR}/../resource/import_api.robot

*** Test Case ***
TC001 Verify response api method get
      ${resp}=      Get request api
      Verify response body is not empty        ${resp}
      Verify response id should not be null      ${resp}
      Verify lenght response body    ${resp}    ${expected_lenght_size}
      Verify data type id      ${resp}    ${expected}
      Verify data type name      ${resp}    ${expected}
