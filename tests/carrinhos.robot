*** Settings ***

Resource    ../base.resource
Test Setup   Create User and Login

*** Test Cases ***

Criar carrinho
     ${response}    POST Produtos    
    ...    produto_${FakerData.random_number(digits=3)}  
    ...    27    
    ...    MOUSE    
    ...    100
    POST Carrinho    id_produtos=${response.json()['_id']}   quantidade=100

    Assert POST Carrinhos    ${response}    Cadastro realizado com sucesso

    ${response_delete_carrinho}    DELETE Concluir Carrinho
    Assert DELETE Concluir Carrinho    ${response_delete_carrinho}    Registro excluído com sucesso

Concluir Carrinho sem usuario associado
    ${response_delete_carrinho}    DELETE Concluir Carrinho
    Assert DELETE Concluir Carrinho    ${response_delete_carrinho}    Não foi encontrado carrinho para esse usuário
    
Concluir Carrinho com Token Ausente
    ${response}    POST Produtos    
    ...    produto_${FakerData.random_number(digits=3)}
    ...    27    
    ...    MOUSE    
    ...    100
    POST Carrinho    id_produtos=${response.json()['_id']}   quantidade=100

    Assert POST Carrinhos    ${response}    Cadastro realizado com sucesso

    ${response_delete_carrinho}    DELETE Concluir Carrinho    expected_status=401        unauthorized=${True}
    Assert DELETE Concluir Carrinho    ${response_delete_carrinho}   Token de acesso ausente, inválido, expirado ou usuário do token não existe mais