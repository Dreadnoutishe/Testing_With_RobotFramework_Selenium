*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE URL}    https://practice-automation.com/
${CHROMEDRIVER}    ${CURDIR}/../Resources/chromedriver.exe
*** Test Cases ***
Ads Modal -> open and close
    [Documentation]    Open main page, go to Ads section, wait for popup, close it, and verify it disappears.
    Open Browser    ${BASE URL}    Chrome    executable_path=${CHROMEDRIVER}
    Maximize Browser Window

    # --- Step 1: Click the Ads button ---
    Wait Until Element Is Visible    xpath=//a[@href='https://practice-automation.com/ads/']    10s
    Scroll Element Into View         xpath=//a[@href='https://practice-automation.com/ads/']
    Sleep    1s
    Click Element                    xpath=//a[@href='https://practice-automation.com/ads/']

    Close Ad Popup

    [Teardown]    Close Browser

*** Keywords ***
Close Ad Popup
    Wait Until Page Contains Element    xpath=/html/body/div[5]/div/button    7s
    Sleep    7s
    Execute JavaScript    document.evaluate("/html/body/div[5]/div/button", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
    Sleep    2s
    Wait Until Element Does Not Contain    css=html    popmake-active    1s