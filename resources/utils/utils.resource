*** Settings ***

Resource    ../../base.resource

*** Keywords ***

Create User and Login
    Create Serverest Session
    Set Local Variable    ${email}    ${FakerData.email()}
    POST Usuarios
    ...    email=${email}
    Login On Serverest    email=${email}  password=1234
   

