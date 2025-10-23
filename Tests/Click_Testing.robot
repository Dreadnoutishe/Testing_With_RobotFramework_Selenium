*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE URL}        https://practice-automation.com/
${CHROMEDRIVER}    ${CURDIR}/../Resources/chromedriver.exe


*** Test Cases ***
Click Events -> Verify Animal Sounds
    [Documentation]    Opens Click Events page, clicks each animal button, and verifies the displayed sound text.

    # --- Step 1: Open main page ---
    Open Browser    ${BASE URL}    Chrome    executable_path=${CHROMEDRIVER}
    Maximize Browser Window
    Sleep    1s

    # --- Step 2: Navigate to Click Events page ---
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Click Events')]    10s
    Scroll Element Into View    xpath=//a[contains(text(),'Click Events')]
    Click Element    xpath=//a[contains(text(),'Click Events')]
    Sleep    4s

    # --- Step 3: Click Cat and verify ---
    Scroll Element Into View    xpath=//button[normalize-space()='Cat']
    Click Element    xpath=//button[normalize-space()='Cat']
    Sleep    1s
    Wait Until Page Contains Element    xpath=//h2[@id='demo' and text()='Meow!']    5s
    Log To Console    ✅ Cat button shows: Meow!

    # --- Step 4: Click Dog and verify ---
    Scroll Element Into View    xpath=//button[normalize-space()='Dog']
    Click Element    xpath=//button[normalize-space()='Dog']
    Sleep    1s
    Wait Until Page Contains Element    xpath=//h2[@id='demo' and text()='Woof!']    5s
    Log To Console    ✅ Dog button shows: Woof!

    # --- Step 5: Click Pig and verify ---
    Scroll Element Into View    xpath=//button[normalize-space()='Pig']
    Click Element    xpath=//button[normalize-space()='Pig']
    Sleep    1s
    Wait Until Page Contains Element    xpath=//h2[@id='demo' and text()='Oink!']    5s
    Log To Console    ✅ Pig button shows: Oink!

    # --- Step 6: Click Cow and verify ---
    Scroll Element Into View    xpath=//button[normalize-space()='Cow']
    Click Element    xpath=//button[normalize-space()='Cow']
    Sleep    1s
    Wait Until Page Contains Element    xpath=//h2[@id='demo' and text()='Moo!']    5s
    Log To Console    ✅ Cow button shows: Moo!

    # --- Step 7: Wrap up ---
    Capture Page Screenshot
    Close Browser
