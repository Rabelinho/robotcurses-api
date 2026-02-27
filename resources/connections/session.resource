*** Settings ***

Library    RequestsLibrary
Resource   ../../base.resource

*** Keywords ***

Create Serverest Session

    Create Session    alias=${serverest.alias}    url=${serverest.url}    disable_warnings=${True}



    