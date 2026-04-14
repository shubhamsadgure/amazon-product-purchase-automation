*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    ../test_data/test_data.robot
Resource    ../pages/HomePage.robot
Resource    ../pages/ProductPage.robot
Resource    ../pages/CartPage.robot



*** Keywords ***
Open Amazon Home Page
    Log To Console    Opening the Browser

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    # Browser settings
    #Evaluate    $options.add_argument("--headless=new")
    Evaluate    $options.add_argument("--no-sandbox")
    Evaluate    $options.add_argument("--disable-dev-shm-usage")
    Evaluate    $options.add_argument("--disable-gpu")
    Evaluate    $options.add_argument("--window-size=1920,1080")
    Evaluate    $options.add_argument("--incognito")

    # Disable popups / password manager
    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=False
    ...    profile.password_manager_enabled=False
    ...    safebrowsing.enabled=False
    ...    profile.default_content_setting_values.notifications=2
    ...    profile.default_content_setting_values.geolocation=2
    ...    profile.default_content_setting_values.media_stream=2

    Evaluate    $options.add_experimental_option("prefs", $prefs)

    # Extra stability options
    Evaluate    $options.add_argument("--disable-notifications")
    Evaluate    $options.add_argument("--disable-infobars")
    Evaluate    $options.add_argument("--disable-extensions")

    # Open Browser
    Open Browser    ${URL}    ${BROWSER}    options=${options}

    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Sleep    10s


Open Browser With Local Network Allowed
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    ${prefs}=    Create Dictionary
    ...    profile.default_content_setting_values.notifications=2
    ...    profile.default_content_setting_values.geolocation=2

    Call Method    ${options}    add_experimental_option    prefs    ${prefs}

    Open Browser    ${URL}    ${BROWSER}    options=${options}
    Sleep    10s



Verify Amazon Page Title
    Log To Console    Verifying the Title
    ${actual_title}=    Get Title
    Should Be Equal    ${actual_title}    ${VALIDATE_TITLE_MSG}
    Log To Console    ${actual_title}
    Sleep    2s


Search Product
    Log To Console    Searching the Product
    Wait Until Element Is Visible    ${searchBoxHomePahe}
    Input Text    ${searchBoxHomePahe}    ${PRODUCT_NAME}
    Click Button  ${searchButton}
    Sleep    2s


Validate Product Matches Search Keyword
    Log To Console    Validating that the product matches the search keyword
    ${actual_product}=    Get Text    ${Get_Specificatio}
    Log To Console    Actual Product: ${actual_product}

    Run Keyword If    '${PRODUCT_SPECIFICATION.lower()}' in '${actual_product.lower()}'
    ...    Click Element    ${Match_Product}
    Sleep    2s
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[-1]
    Sleep    5s


Validate Product Details On Product Page
    Log To Console    Validating the detais in product page
    Mouse Over      ${Get_Product_Title}
    ${actual_title}=    Get Text    ${Get_Product_Title}
    #Log To Console    ${actual_title}

    Mouse Over      ${Get_Product_Prize}
    ${actual_prize}=    Get Text    ${Get_Product_Prize}
    #Log To Console    ${actual_prize}


     Mouse Over      ${Get_Product_Stroge_Size}
     ${actual_storage_Size}=    Get Text    ${Get_Product_Stroge_Size}
     #Log To Console    ${actual_storage_Size}


     Mouse Over      ${Get_Product_Colour}
     ${actual_colur}=    Get Text    ${Get_Product_Colour}
     #Log To Console    ${actual_colur}


    #Run Keyword If    '${PRODUCT_NAME}' not in '${actual_title}'    Fail    Product name mismatch
    Should Contain    ${actual_title}    ${PRODUCT_NAME2}
    Should Contain    ${PRODUCT_STORAGE}  ${actual_storage_Size}
    Should Contain    ${PRODUCT_COLUR}    ${actual_colur}
    Should Contain    ${PRODUCT_PRIZE}    ${actual_prize}


Click Add To Cart
    Log To Console    Clicking on add to cart button
    Scroll Element Into View    ${Add_Cart_Optin}
    Click Element               ${Add_Cart_Optin}



Verify the price
    Log To Console    Verifying the price

    ${cart_price}=    Get Text    ${Get_Price_Side_Bar}
    ${cart_price}=    Remove String    ${cart_price}    ₹    .00
    ${cart_price}=    Strip String     ${cart_price}

    Should Be Equal As Strings    ${cart_price}    ${PRODUCT_PRIZE}








