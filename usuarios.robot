*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Cenario 1: Criar Usuario
    
    ${body}     Create Dictionary    
    ...    nome=Rabelos     
    ...    email=test3@test.com.br    
    ...    password=1234   
    ...    administrador=false

    ${response}    POST    
    ...    url=https://serverest.dev/usuarios    
    ...    json=${body}    
    ...    expected_status=201  

    Should Be Equal    ${response.json()['message']}   Cadastro realizado com sucesso
    Should Not Be Empty    ${response.json()['_id']}
    
Cenario 2: Criar usuario com Email ja Utilizado

    ${body}    Create Dictionary    
    ...    nome=Rabelos2    
    ...    email=test3@test.com.br    
    ...    password=1234    
    ...    administrador=false

    ${response}    POST    
    ...    url=https://serverest.dev/usuarios    
    ...    json=${body}    
    ...    expected_status=400
    
    Should Be Equal    ${response.json()['message']}    Este email já está sendo usado

Cenario 3: Buscar Usuario
    ${body}    Create Dictionary    
    ...    nome=Pedro    
    ...    email=test05@test.com.br    
    ...    password=12345    
    ...    administrador=false

    ${response_post_usuarios}    POST    
    ...    url=https://serverest.dev/usuarios
    ...    json=${body}    
    ...    expected_status=201
   
   ${response_get_usuarios}    GET    
   ...    url=https://serverest.dev/#/Usu%C3%A1rios/${response_post_usuarios.json()["_id"]}
   ...    expected_status=200

    Should Be Equal    ${body["nome"]}    ${response_get_usuarios.json()["nome"]}
    Should Be Equal    ${body["email"]}    ${response_get_usuarios.json()["email"]}
    Should Be Equal    ${body["password"]}    ${response_get_usuarios()["password"]}
    Should Be Equal    ${body["administrador"]}    ${response_get_usuarios()["administrador"]}
    Should Be Equal    ${response_post_usuarios.json()["_id"]}    ${response_get_usuarios()["_id"]}