*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource   ../test_data/test_data.robot

*** Variables ***
${searchBoxHomePahe}    id:twotabsearchtextbox
${searchButton}         id:nav-search-submit-button
${Get_Specificatio}     xpath=//span[contains(text(),'iPhone 17 Pro Max 256 GB: 17.42 cm (6.9″) Display ')]
${Match_Product}        xpath=//span[contains(text(),'iPhone 17 Pro Max 256 GB: 17.42 cm (6.9″) Display ')]



