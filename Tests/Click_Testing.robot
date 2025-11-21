*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/BrowserStackSetup.resource

*** Variables ***
${BASE URL}    https://practice-automation.com/
${BROWSER}     Chrome    # overridden via CLI

*** Test Cases ***
Click Events -> Verify Animal Sounds
    [Documentation]    Opens Click Events page, clicks each animal button, and verifies the displayed sound text.

    # --- Step 1: Open main page ---
    Open BrowserStack Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

    # --- Step 2: Navigate to “Click Events” page using JS click (scroll-free) ---
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Click Events')]    10s
    Execute JavaScript    document.querySelector('a[href="https://practice-automation.com/click-events/"]').click()
    Sleep    2s

    # --- Step 3: Click Cat ---
    Execute JavaScript    document.querySelector('button[onclick="catSound()"]').click()
    Wait Until Page Contains Element    xpath=//h2[@id='demo' and text()='Meow!']    5s

    # --- Step 4: Click Dog ---
    Execute JavaScript    document.querySelector('button[onclick="dogSound()"]').click()
    Wait Until Page Contains Element    xpath=//h2[@id='demo' and text()='Woof!']    5s

    # --- Step 5: Click Pig ---
    Execute JavaScript    document.querySelector('button[onclick="pigSound()"]').click()
    Wait Until Page Contains Element    xpath=//h2[@id='demo' and text()='Oink!']    5s

    # --- Step 6: Click Cow ---
    Execute JavaScript    document.querySelector('button[onclick="cowSound()"]').click()
    Wait Until Page Contains Element    xpath=//h2[@id='demo' and text()='Moo!']    5s

    # --- Step 7: Finish ---
    Capture Page Screenshot
    Close Browser

