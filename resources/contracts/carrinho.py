def contracts_post_carrinhos(id_produto: str, quantidade: str):

    return {
        "produtos": [
            {
                "idProduto": id_produto,
                "quantidade": quantidade
            } #for product, quantity in zip (id_produto, quantidade)
        ]
    }