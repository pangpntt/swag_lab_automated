*** Settings ***
Library        SeleniumLibrary

*** Keywords ***
Wait until element is ready then click element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Click Element    ${locator}

Wait until element is ready then input text
    [Arguments]    ${locator}    ${text}
    Wait Until Keyword Succeeds    5x    2s    Input Text    ${locator}    ${text}

Wait until page contains text then verify text
    [Arguments]    ${expected_text}
    Wait Until Keyword Succeeds    5x    2s    Page Should Contain    ${expected_text}

Wait until page contains element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Page Should Contain Element    ${locator}

Wait until error message contains text
    [Arguments]    ${expected_text}
    Wait Until Keyword Succeeds    5x    2s    Element Should Be Visible    css=h3[data-test="error"]
    Element Text Should Be    css=h3[data-test="error"]    ${expected_text}




