*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/BrowserStackSetup.resource

*** Variables ***
${BASE URL}    https://practice-automation.com/
${BROWSER}     Chrome    # default, overridden with CLI values

*** Test Cases ***
Form Fields -> Fill and Submit
    [Documentation]    Opens the form fields page, fills out the form with example data, and submits it.

    # --- Step 1: Open main page on BrowserStack ---
    Open BrowserStack Browser    ${BASE URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s

    # --- Step 2: Navigate to Form Fields page (JS click) ---
    Execute JavaScript    document.querySelector('a[href="https://practice-automation.com/form-fields/"]').click()
    Sleep    2s

    # --- Step 3: Name field ---
    Execute JavaScript    document.getElementById("name-input").value = "James Watson"
    Sleep    1s

    # --- Step 4: Password field ---
    Execute JavaScript    document.querySelector('input[type="password"]').value = "TestPass123"
    Sleep    1s

    # --- Step 5: Favorite drinks ---
    Execute JavaScript    document.getElementById("drink1").click()
    Sleep    1s
    Execute JavaScript    document.getElementById("drink3").click()
    Sleep    1s

    # --- Step 6: Choose favorite color ---
    Execute JavaScript    document.getElementById("color2").click()
    Sleep    1s

    # --- Step 7: Choose automation preference ---
    Execute JavaScript    document.getElementById("automation").value = "yes"
    Sleep    1s

    # --- Step 8: Email ---
    Execute JavaScript    document.getElementById("email").value = "james.watson@example.com"
    Sleep    1s

    # --- Step 9: Message ---
    Execute JavaScript    document.getElementById("message").value = "This is a test message for automation practice."
    Sleep    1s

    # --- Step 10: Submit form ---
    Execute JavaScript    document.getElementById("submit-btn").click()
    Sleep    2s

    Close Browser

