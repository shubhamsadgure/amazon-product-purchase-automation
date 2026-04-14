*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource   ../test_data/test_data.robot

*** Variables ***
#Product Specification
${Get_Product_Title}    xpath://span[@id='productTitle']
${Get_Product_Prize}    xpath://span[normalize-space()='1,49,900']
${Get_Product_Stroge_Size}      id:inline-twister-expanded-dimension-text-size_name
${Get_Product_Colour}       id:inline-twister-expanded-dimension-text-color_name
${Add_Cart_Optin}           xpath:(//input[@id='add-to-cart-button'])[2]