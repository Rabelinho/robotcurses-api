*** Settings ***
Library    RequestsLibrary
Resource    ../../../../base.resource

*** Keywords ***
GET Produtos by id
    [Arguments]    ${id}    ${expected_status}=200

    ${response}    GET On Session    
    ...    alias=${serverest.alias}    
    ...    url=/produtos/${id}    
    ...    expected_status=${expected_status}
    
    RETURN    ${response}
