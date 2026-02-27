*** Settings ***
Library    RequestsLibrary
Resource    ../../../../base.resource

*** Keywords ***

DELETE Produtos
    [Arguments]    ${id}    ${expected_status}=200

    ${response}    DELETE On Session    
    ...    alias=${serverest.alias}   
    ...    url=/produtos/${id}    
    ...    expected_status=${expected_status}

    RETURN    ${response}

Assert DELETE Produtos
    [Arguments]    ${response}    
    ...    ${message}
      

    IF     ${response.status_code} == ${200}
       Should Be Equal   ${response.json()['message']}     ${message}
       
   END