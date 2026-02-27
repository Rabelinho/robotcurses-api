*** Settings ***

Library    RequestsLibrary
Resource    ../../../../base.resource


*** Keywords ***
GET Usuarios by id
    [Arguments]    ${id}    ${expected_status}=200

    ${response}    GET On Session    
    ...    alias=${serverest.alias}
    ...    url=/usuarios/${id}
    ...    expected_status=${expected_status}
    
    RETURN    ${response}

Assert GET Usuarios
    [Arguments]    ${response}    
    ...    ${nome}=${EMPTY}
    ...    ${email}=${EMPTY}
    ...    ${password}=${EMPTY}
    ...    ${administrador}=${EMPTY}
    ...    ${id}=${EMPTY}
    ...    ${message}=${EMPTY}    

    IF    ${response.status_code} == ${200}
        Should Be Equal    ${response.json()['nome']}    ${nome}
        Should Be Equal    ${response.json()['email']}    ${email}
        Should Be Equal    ${response.json()['password']}    ${password}
        Should Be Equal    ${response.json()['administrador']}    ${administrador}
        Should Be Equal    ${response.json()['_id']}    ${id}
    ELSE IF    ${response.status_code} == ${400}
        TRY
            Should Be Equal    ${response.json()['id']}    ${message}
        EXCEPT   
            Should Be Equal    ${response.json()['message']}    ${message}
        END   
    END
    