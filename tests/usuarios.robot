*** Settings ***

Resource    ../base.resource
Test Setup    Create Serverest Session

*** Test Cases ***

Criar Usuario
    ${response}    POST Usuarios
    ...    email=${FakerData.email()}
    Assert POST Usuarios    ${response}


Buscar Usuario
    Set Local Variable    ${user_email}    ${FakerData.email()}
    ${response_post_usuarios}    POST Usuarios    
    ...    email=${user_email}
    ${response_get_usuarios}    GET Usuarios by id    ${response_post_usuarios.json()['_id']}
    Assert GET Usuarios    ${response_get_usuarios}    
    ...    nome=Rabelos      
    ...    email=${user_email}
    ...    password=1234
    ...    administrador=true
    ...    id=${response_post_usuarios.json()['_id']}


Buscar Usuario inexistente
    ${response_get_usuarios}    GET Usuarios by id    1234abc478965412   400
    Assert GET Usuarios    ${response_get_usuarios}    
    ...    message=Usuário não encontrado

Realizar busca por Usuario com Id com mais de 16 caracteres
    
    ${response_get_usuarios}    GET Usuarios by id    123456789LOPOKILJU090  400
    Assert GET Usuarios    ${response_get_usuarios} 
    ...    message=id deve ter exatamente 16 caracteres alfanuméricos

Deletar Usuario
     ${response_post_usuarios}    POST Usuarios
    ...    email=testServerest5692@test.com.br
     ${resonse_delete_usuarios}    DELETE Usuarios    ${response_post_usuarios.json()['_id']}
     Assert DELETE Usuarios    ${resonse_delete_usuarios}    
     ...    message=Registro excluído com sucesso

     
    
