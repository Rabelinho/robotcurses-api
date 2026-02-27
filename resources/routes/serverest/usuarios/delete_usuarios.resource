*** Settings ***

Library    RequestsLibrary
Resource    ../../../../base.resource


*** Keywords ***

DELETE Usuarios
     [Arguments]    ${id}    ${expected_status}=200

    
    ${response}    DELETE On Session    
    ...    alias=${serverest.alias}    
    ...    url=/usuarios/${id}
    ...    expected_status=${expected_status}
    
    RETURN    ${response}

Assert DELETE Usuarios
    [Arguments]    ${response}    
    ...    ${message}=${EMPTY}
    
   IF     ${response.status_code} == ${200}
       Should Be Equal   ${response.json()['message']}     ${message}
       
   END

