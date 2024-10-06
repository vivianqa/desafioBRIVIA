*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    BuiltIn  
Resource   ../resources/keywords.robot

*** Variables ***
${URL}         https://www.demoblaze.com

*** Test Cases ***
Criação de Conta e Validação
    [Documentation]    Cria uma nova conta e verifica se o usuário foi criado com sucesso.
    ${USERNAME}    ${PASSWORD}=    Gerar Nome de Usuário e Senha
    Abrir Página
    Criar Conta    ${USERNAME}    ${PASSWORD}
    Acessar a Conta Criada    ${USERNAME}    ${PASSWORD}
    Verificar Conta Criada    ${USERNAME}
