*** Settings ***
Library    RequestsLibrary
Library    ../../../contracts/carrinho.py
Resource    ../../../../base.resource

*** Keywords ***

POST Carrinho
    [Arguments]    ${id_produtos}    ${quantidade}    ${expected_status}=201
    
    ${body}    Contracts Post Carrinhos      id_produto=${id_produtos}    quantidade=${quantidade}

   ${response}    POST On Session  
   ...    alias=${serverest.alias}     
   ...    url=/carrinhos    
   ...    json=${body}    
   ...    expected_status=${expected_status}

   RETURN    ${response}

Assert POST Carrinhos 
    [Arguments]    ${response}    ${message}
    #Should Be Equal    ${response.json()['message']}    Cadastro realizado com sucesso
    #Should Be Empty    ${response.json()['_id']}

    IF    ${response.status_code} == ${201}
        Should Be Equal    ${response.json()['message']}    ${message}
        Should Not Be Empty    ${response.json()['_id']}
    ELSE IF    ${response.status_code} == ${400} or ${response.status_code} == ${401}
        Should Be Equal    ${response.json()['message']}    ${message}
    END    
    