*** Settings ***
Library    RequestsLibrary
Resource    ../../../../base.resource

*** Keywords ***

Login On Serverest
    [Arguments]    ${email}  ${password}  ${expected_status}=200

    ${body}    Create Dictionary    
    ...    email=${email}    
    ...    password=${password}

    ${response}    POST On Session   
    ...    alias=${serverest.alias}    
    ...    url=/login    
    ...    json=${body} 
    ...    expected_status=${expected_status}

    ${header}    Create Dictionary
    ...    Authorization=${response.json()['authorization']}

    Update Session    
    ...    alias=${serverest.alias}    
    ...    headers=${header}

    RETURN    ${response}


