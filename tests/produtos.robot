*** Settings ***

Resource    ../base.resource
Test Setup    Create User and Login

*** Test Cases ***

Cadastrar Produtos
    ${response}    POST Produtos    
    ...    produto_${FakerData.random_number(digits=3)}
    ...    27    
    ...    MOUSE    
    ...    100

Buscar Produtos
    ${response_post_produtos}    POST Produtos    
    ...    produto_${FakerData.random_number(digits=3)}
    ...    28   
    ...    Audio  
    ...    100
     ${response_get_produtos}    GET Produtos by id    ${response_post_produtos.json()['_id']}    

Deletar Produtos
    ${response_post_produtos}    POST Produtos    
    ...    produto_${FakerData.random_number(digits=3)}
    ...    10    
    ...    Audio    
    ...    1000
    ${response_delete_produtos}    DELETE Produtos    ${response_post_produtos.json()['_id']}
    Assert DELETE Produtos    ${response_delete_produtos}    Registro excluído com sucesso 
    