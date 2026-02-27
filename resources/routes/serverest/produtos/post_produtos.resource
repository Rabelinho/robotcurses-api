*** Settings ***

Library    RequestsLibrary
Resource    ../../../../base.resource

*** Keywords ***

POST Produtos
    [Arguments]      ${nome}    ${preco}    ${descricao}    ${quantidade}

    ${body}    Create Dictionary    
    ...    nome=${nome}    
    ...    preco=${preco}    
    ...    descricao=${descricao}    
    ...    quantidade=${quantidade}
    
    ${response}    POST On Session    
    ...    alias=${serverest.alias}    
    ...    url=/produtos    
    ...    json=${body}    
    ...    expected_status=201
    
    RETURN    ${response}