*** Settings ***
Library    RequestsLibrary
Resource    ../../../../base.resource

*** Keywords ***

DELETE Concluir Carrinho
    [Arguments]    ${expected_status}=200    ${unauthorized}=${False}

    
    IF    ${unauthorized}
        ${header}    Create Dictionary
        ...    Authorization=${None}
        Update Session    alias=${serverest.alias}    headers=${header}
    END
    
    ${response}    DELETE On Session   
    ...    alias=${serverest.alias}   
    ...    url=/carrinhos/concluir-compra    
    ...    expected_status=${expected_status}
    
    RETURN    ${response}

Assert DELETE Concluir Carrinho
    [Arguments]    ${response}    ${message}

    Should Be Equal    ${response.json()['message']}    ${message}
       
        
    