*** Keywords ***
click link buy iphone
      Wait Until Element Is Visible   ${link_buy}   10 seconds
      Click Element       ${link_buy}
      Capture Page Screenshot    EMBED

select iphone 12 type
     Wait Until Element Is Visible       //div[@class="rc-dimension-selector-row form-selector"]/../..//*[text()="฿25,900"]   10 seconds
      click element      //div[@class="rc-dimension-selector-row form-selector"]/../..//*[text()="฿25,900"]

select color
     [Arguments]      ${colour}
     Wait Until Element Is Visible     //label[@class="form-selector-label"]/../../..//*[text()="${colour}"]    10 seconds
     click element    //label[@class="form-selector-label"]/../../..//*[text()="${colour}"]

select storage
     [Arguments]      ${storage}
     Wait Until Element Is Visible     //label[@class="form-selector-label"]/../../..//*[text()="${storage}"]   10 seconds
     click element    //label[@class="form-selector-label"]/../../..//*[text()="${storage}"]

add to cart
     Wait Until Element Is Visible   //button[@name="add-to-cart"]    10 seconds
    click button   //button[@name="add-to-cart"]

proceed product
     Wait Until Element Is Visible    //button[@name="proceed"]     10 seconds
     click button     //button[@name="proceed"]