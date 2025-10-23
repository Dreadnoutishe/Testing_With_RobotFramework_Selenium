*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE URL}        https://practice-automation.com/
${CHROMEDRIVER}    ${CURDIR}/../Resources/chromedriver.exe

*** Test Cases ***
Form Fields -> Fill and Submit
    [Documentation]    Opens the form fields page, fills out the form with example data, and submits it.

    # --- Step 1: Open main page ---
    Open Browser    ${BASE URL}    Chrome    executable_path=${CHROMEDRIVER}
    Maximize Browser Window

    # --- Step 2: Navigate to Form Fields page ---
    Click Link    xpath=//a[contains(text(),'Form Fields')]
    Sleep    2s

    # --- Step 3: Fill out Name field ---
    Scroll Element Into View    id=name-input
    Input Text    id=name-input    James Watson
    Sleep    1s

    # --- Step 4: Fill out Password field ---
    Scroll Element Into View    xpath=//input[@type='password']
    Input Text    xpath=//input[@type='password']    TestPass123
    Sleep    1s

    # --- Step 5: Select favorite drinks ---
    Scroll Element Into View    id=drink3
    Click Element    id=drink1    # Water
    Sleep    1s
    Click Element    id=drink3    # Coffee
    Sleep    1s

    # --- Step 6: Choose favorite color ---
    Scroll Element Into View    id=color2
    Execute JavaScript    document.getElementById("color2").click()
    Sleep    1s

    # --- Step 7: Choose automation preference ---
    Scroll Element Into View    id=automation
    Select From List By Value    id=automation    yes
    Sleep    1s

    # --- Step 8: Fill out Email ---
    Scroll Element Into View    id=email
    Input Text    id=email    james.watson@example.com
    Sleep    1s

    # --- Step 9: Fill out Message ---
    Scroll Element Into View    id=message
    Input Text    id=message    This is a test message for automation practice.
    Sleep    1s

    # --- Step 10: Submit form ---
    Scroll Element Into View    id=submit-btn
    Click Element    id=submit-btn
    Sleep    1s

    # --- Step 12: Finish ---
    Close Browser