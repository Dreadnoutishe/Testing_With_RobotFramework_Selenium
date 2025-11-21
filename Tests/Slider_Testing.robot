*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/BrowserStackSetup.resource

*** Variables ***
${BASE URL}    https://practice-automation.com/
${BROWSER}     Chrome    # Default, overridden by CLI

*** Test Cases ***
Slider -> Move to 100 and Back to 0
    # --- Step 1: Open main page on BrowserStack ---
    Open BrowserStack Browser    ${BASE URL}    ${BROWSER}

    Maximize Browser Window
    Sleep    1s

    # --- Click the 'Sliders' button (custom button link) ---
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Sliders')]    10s
    Scroll Element Into View         xpath=//a[contains(text(),'Sliders')]
    Click Element                    xpath=//a[contains(text(),'Sliders')]
    Sleep    2s

    # --- Now move slider to 100 ---
    Wait Until Element Is Visible    id=slideMe    10s
    Execute JavaScript    document.getElementById('slideMe').value = 100; document.getElementById('value').innerText = 100;
    ${val100}=    Get Element Attribute    id=slideMe    value
    Should Be Equal As Strings    ${val100}    100
    Log To Console    ✅ Slider moved to 100 successfully.
    Sleep    3s

    # --- Move slider to 0 ---
    Execute JavaScript    document.getElementById('slideMe').value = 0; document.getElementById('value').innerText = 0;
    ${val0}=    Get Element Attribute    id=slideMe    value
    Should Be Equal As Strings    ${val0}    0
    Log To Console    ✅ Slider moved to 0 successfully.
    Sleep    2s

    Capture Page Screenshot
    Close Browser
