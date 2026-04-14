*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource   ../test_data/test_data.robot

*** Variables ***
${Get_Price_Side_Bar}       xpath://span[@class='a-size-base a-text-bold'][contains(text(),'₹1,49,900.00')]
${Get_Price_From_The_SubTotal}   xpath://span[@class='a-price sw-subtotal-amount']//span[@class='a-price-whole']



