*** Keywords ***
add cart iphone and select storage and colour
     [Arguments]  ${color}   ${storage}
      click link buy iphone
      select iphone 12 type
      select color         ${color}
      select storage       ${storage}
      add to cart
      proceed product

select quantity product
      [Arguments]  ${quantity}
      click element   //div[@class="rs-quantity-wrapper form-dropdown"]
      wait until element is visible      //option[@value="${quantity}"]
      click element   //option[@value="${quantity}"]
      click element    //div[@id="bag-content"]

verify price section (นี่คือรายการสินค้าที่อยู่ในถุงของคุณ+value)
      [Arguments]   ${expected_price}
      wait until element is visible    //div[@class="rs-bag-button-header large-12"]//h1
      ${get_text}   get text    //div[@class="rs-bag-button-header large-12"]//h1
      ${total_price}      Get Substring     ${get_text}      38
      should be equal as strings    ${total_price}           ${expected_price}

verify item info (iPhone 12 mini ความจุ+value สี+value)
       [Arguments]       ${colour_expected}    ${storage_expected}
       wait until element is visible    //h2[@class="rs-iteminfo-title"]
       ${get_text}   get text    //h2[@class="rs-iteminfo-title"]
       ${colour}    Get Substring     ${get_text}      30
       should be equal as strings      ${colour}      ${colour_expected}
       @{storage}    Split String From Right    ${get_text}     ${SPACE}
       ${storage_value}     EVALUATE   '${storage}[4]'.replace('GB','')
        should be equal as strings      ${storage_value}     ${storage_expected}
        Capture Page Screenshot    EMBED

verify item info price
      [Arguments]         ${iphone_price}
      Wait Until Element Is Visible      //div[@class="rs-iteminfo-price"]//p
      ${getprice}    get text      //div[@class="rs-iteminfo-price"]//p
      ${price}     Get Substring     ${getprice}     1
      should be equal    ${price}     ${iphone_price}

verify your payment (ยอดชำระเงินของคุณ)
      [Arguments]         ${iphone_price}
     Wait Until Element Is Visible      //div[@class="rs-summary-labelandvaluecontainer rs-summary-total"]//div[@class="rs-summary-value"]
     ${get_price}    get text      //div[@class="rs-summary-labelandvaluecontainer rs-summary-total"]//div[@class="rs-summary-value"]
      ${price}     Get Substring     ${getprice}     1
     should be equal    ${price}     ${iphone_price}

calculate price
     [Arguments]     ${quantity}    ${iphone_price}
     ${cal_price}=    Evaluate     ${quantity}*${iphone_price}
      ${sum_price}=    Evaluate    "{:,.2f}".format(${cal_price})
      sleep  3
      Capture Page Screenshot    EMBED
      [Return]    ${sum_price}

click link buy iphone
      Wait Until Element Is Visible   //a[@href="/th/shop/goto/buy_iphone/iphone_12"]   60 seconds
      Click Element       //a[@href="/th/shop/goto/buy_iphone/iphone_12"]
      Capture Page Screenshot    EMBED

select iphone 12 type
     Wait Until Element Is Visible       //div[@class="rc-dimension-selector-row form-selector"]/../..//*[text()="฿25,900"]   60 seconds
      click element      //div[@class="rc-dimension-selector-row form-selector"]/../..//*[text()="฿25,900"]
      Capture Page Screenshot    EMBED

select color
     [Arguments]      ${colour}
     Wait Until Element Is Visible     //label[@class="form-selector-label"]/../../..//*[text()="${colour}"]    60 seconds
     click element    //label[@class="form-selector-label"]/../../..//*[text()="${colour}"]

select storage
     [Arguments]      ${storage}
     Wait Until Element Is Visible     //div[@class="rc-dimension-multiple form-selector-threeline column large-6 small-6 form-selector"]/../../..//*[text()="${storage}"]   10 seconds
     click element    //div[@class="rc-dimension-multiple form-selector-threeline column large-6 small-6 form-selector"]/../../..//*[text()="${storage}"]

add to cart
     Wait Until Element Is Visible   //button[@name="add-to-cart"]    60 seconds
    click button   //button[@name="add-to-cart"]

proceed product
     Wait Until Element Is Visible    //button[@name="proceed"]     60 seconds
     click button     //button[@name="proceed"]