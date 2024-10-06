*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    BuiltIn  
Resource   ../resources/keywords.robot

*** Variables ***
${URL}         https://www.demoblaze.com/
${PHONE}       Iphone 6 32gb
${LAPTOPS}     MacBook Pro
${MONITORS}    ASUS Full HD

*** Test Cases ***
Compra de Produtos
    [Documentation]    Realiza a compra de três produtos.
    ${USERNAME}    ${PASSWORD}=    Gerar Nome de Usuário e Senha
    Abrir Página
    Criar Conta    ${USERNAME}    ${PASSWORD}
    Acessar a Conta Criada    ${USERNAME}    ${PASSWORD}
    Verificar Conta Criada    ${USERNAME}
    Permanecer na Home
    Adicionar Produtos ao Carrinho