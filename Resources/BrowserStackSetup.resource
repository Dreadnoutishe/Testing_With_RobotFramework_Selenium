*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME}          dreadnoutzhks_tnzqWD
${ACCESS_KEY}        thhsxx1b4gAug2n2xjPN
${REMOTE_URL}        https://${USERNAME}:${ACCESS_KEY}@hub.browserstack.com/wd/hub


# ---- Chrome on Windows 11 ----
&{CAPS_CHROME}
...    browserName=Chrome
...    browserVersion=latest
...    os=Windows
...    osVersion=11
...    seleniumVersion=4.25.0

# ---- Chrome on Mobile phone ----
&{CAPS_ANDROID}
...    browserName=Chrome
...    deviceName=Samsung Galaxy S23
...    osVersion=13.0
...    realMobile=true


# ---- Edge on Windows 11 ----
&{CAPS_EDGE}
...    browserName=Edge
...    browserVersion=latest
...    os=Windows
...    osVersion=11
...    seleniumVersion=4.25.0



*** Keywords ***
Open BrowserStack Browser
    [Arguments]    ${URL}    ${BROWSER}

    Run Keyword If    '${BROWSER}'=='Chrome'
    ...    Open Browser    ${URL}    browser=chrome     remote_url=${REMOTE_URL}   desired_capabilities=${CAPS_CHROME}

    Run Keyword If    '${BROWSER}'=='Android'
    ...    Open Browser    ${URL}    remote_url=${REMOTE_URL}    desired_capabilities=${CAPS_ANDROID}

    Run Keyword If    '${BROWSER}'=='Edge'
    ...    Open Browser    ${URL}    browser=edge     remote_url=${REMOTE_URL}    desired_capabilities=${CAPS_EDGE}

    Maximize Browser Window

