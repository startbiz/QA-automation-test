*** Settings ***
Resource    ${CURDIR}/../resource/import_ui.robot

*** Test Cases ***
TC001 Verify payment screen apple web
      Open Browser    https://www.apple.com/th/       Chrome
      Maximize Browser Window
      click link buy iphone
      select iphone 12 type
      select color         ม่วง
      select storage       64
      add to cart
      proceed product
      ${text}    get text     //div[@class="rs-iteminfo-price"]
      log    ${text}
