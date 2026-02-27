*** Settings ***

Library    RequestsLibrary
Resource    ../../../../base.resource

*** Keywords ***

POST Usuarios
    [Arguments]    ${email}

    ${body}     Create Dictionary    
    ...    nome=Rabelos     
    ...    email=${email}    
    ...    password=1234   
    ...    administrador=true

    ${response}    POST On Session
    ...    alias=${serverest.alias}
    ...    url=/usuarios    
    ...    json=${body}    
    ...    expected_status=201  

    RETURN  ${response}

Assert POST Usuarios
    [Arguments]    ${response}

    Should Be Equal    ${response.json()['message']}   Cadastro realizado com sucesso
    Should Not Be Empty    ${response.json()['_id']}