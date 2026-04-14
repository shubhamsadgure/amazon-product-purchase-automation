*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/AmazonKeywords.robot




*** Test Cases ***
Verify End-to-End Product Purchase Flow
    Open Amazon Home Page
    Verify Amazon Page Title
    Search Product
    Validate Product Matches Search Keyword
    Validate Product Details On Product Page
    Click Add To Cart
    Verify the price

