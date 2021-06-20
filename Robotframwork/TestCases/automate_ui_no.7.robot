*** Settings ***
Resource    ${CURDIR}/../resource/import_ui.robot

*** Variables ***
${quantity}      1
${iphone_price}     27900.00
${colour}      ม่วง
${storage}     128

*** Test Cases ***
TC001 Verify payment screen apple web
      Open Browser    https://www.apple.com/th/       Chrome
      Maximize Browser Window
      add cart iphone and select storage and colour    ${colour}    ${storage}
      select quantity product     ${quantity}
      ${sum_price}    calculate price     ${quantity}        ${iphone_price}
      verify price section (นี่คือรายการสินค้าที่อยู่ในถุงของคุณ+value)      ${sum_price}
      verify item info (iPhone 12 mini ความจุ+value สี+value)      ${colour}       ${storage}
      verify item info price         ${sum_price}
      verify your payment (ยอดชำระเงินของคุณ)         ${sum_price}