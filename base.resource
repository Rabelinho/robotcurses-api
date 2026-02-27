*** Settings ***
Library    RequestsLibrary

# ===== CONNECTIONS =====
Variables    resources/connections/app_conn.yml
Resource    resources/connections/session.resource

# ===== CONTRACTS =====
Library    resources/contracts/carrinho.py

# ===== DATA =====
Variables    resources/data/faker_data.py

# ===== ROUTES =====
# Carrinho
Resource    resources/routes/serverest/carrinho/post_carrinho.resource
Resource    resources/routes/serverest/carrinho/delete_carrinho.resource

# Login
Resource    resources/routes/serverest/login/login.resource

# Produtos
Resource    resources/routes/serverest/produtos/post_produtos.resource
Resource    resources/routes/serverest/produtos/get_produtos_id.resource
Resource    resources/routes/serverest/produtos/delete_produtos.resource

# Usuarios
Resource    resources/routes/serverest/usuarios/post_usuarios.resource
Resource    resources/routes/serverest/usuarios/get_usuarios_id.resource
Resource    resources/routes/serverest/usuarios/delete_usuarios.resource

# ===== UTILS =====
Resource    resources/utils/utils.resource