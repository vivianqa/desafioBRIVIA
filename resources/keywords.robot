*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Abrir Página
    [Documentation]    Abre a página.
    Open Browser    ${URL}    edge
    Maximize Browser Window
    Sleep    2

Permanecer na Home
    [Documentation]    Permanece na página.
    Maximize Browser Window
    ${URL} =    Get Location
    Should Be Equal    ${URL}    https://www.demoblaze.com/    
    Sleep    2

Gerar Nome de Usuário e Senha
    [Documentation]    Gera um nome de usuário e uma senha.
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${random_username}=    Set Variable    user_${timestamp}
    ${random_password}=    Set Variable    password_${timestamp}
    RETURN    ${random_username}    ${random_password}

Criar Conta
    [Documentation]    Cria uma conta usando o nome de usuário e a senha fornecidos.
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Click Link    Sign up
    Sleep    2
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click Button    //button[text()='Sign up']
    Sleep    2
    Handle Alert

Handle Alert
    [Documentation]    Aceita o alerta se aparecer.
    ${alert_present}=    Run Keyword And Return Status    Wait Until Page Contains Element    //button[text()='OK']    timeout=2
    Run Keyword If    ${alert_present}    Accept Alert
    Run Keyword And Ignore Error    Accept Alert

Acessar a Conta Criada
    [Documentation]    Acessa a conta criada.
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Click Link    Log in
    Sleep    2
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword   ${PASSWORD}
    Click Button  xpath=(//button[@type='button'])[9]
    Sleep    2

Verificar Conta Criada
    [Documentation]    Verifica se o usuário foi criado com sucesso.
    [Arguments]    ${USERNAME}
    Wait Until Element Is Visible   id=nameofuser   timeout=10  #Espera até que o elemento esteja visível
    ${welcome_message}=    Get Text   id=nameofuser  
    Should Contain    ${welcome_message}    Welcome ${USERNAME}
    
Adicionar Produtos ao Carrinho
    [Documentation]  Adiciona produtos no carrinho.
    Sleep    1
    FOR    ${index}    IN RANGE    1
        Execute JavaScript    window.scrollBy(0, window.innerHeight * 0.92);  #Rola % da altura da janela
        Sleep    1  # Aguarda 1 segundo para permitir o carregamento
    END
    Wait Until Element Is Visible    xpath=//a[contains(text(), '${PHONE}')]    timeout=5s
    Scroll Element Into View    xpath=//a[contains(text(), '${PHONE}')]
    Click Element    xpath=//a[contains(text(), '${PHONE}')]
    Sleep    2
    Scroll Element Into View    xpath=//a[contains(text(), 'Add to cart')]
    Click Element    xpath=//a[contains(text(), 'Add to cart')]
    Sleep    2
    Handle Alert
    Click Element    xpath=//a[@class='nav-link' and contains(text(), 'Home')]    #Clicar em Home
    Sleep    1
    FOR    ${index}    IN RANGE    1
        Execute JavaScript    window.scrollBy(0, window.innerHeight * 0.75);  #Rola % da altura da janela
        Sleep    1  #Aguarda segundos para permitir o carregamento
    END
    Execute JavaScript    var style = document.createElement('style'); style.innerHTML = '.highlight { background-color: rgba(255, 255, 0, 0.0); transition: background-color 0.5s, transform 0.2s; transform: scale(1.03); }'; document.head.appendChild(style); var el = document.evaluate("//a[contains(text(),'Monitors')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; if (el) { el.classList.add('highlight'); setTimeout(() => { el.classList.remove('highlight'); }, 700); }
    Click Element    xpath=//a[contains(text(),'Monitors')]    #Clicar no menu Monitors
    FOR    ${index}    IN RANGE    1
        Execute JavaScript    window.scrollBy(0, window.innerHeight * 0.65);  #Rola % da altura da janela
        Sleep    3  #Aguarda segundos para permitir o carregamento
    END
    Wait Until Element Is Visible    xpath=//a[contains(text(), '${MONITORS}')]    timeout=5s
    Scroll Element Into View    xpath=//a[contains(text(), '${MONITORS}')]
    Click Element    xpath=//a[contains(text(), '${MONITORS}')]
    Sleep    2
    Scroll Element Into View    xpath=//a[contains(text(), 'Add to cart')]
    Click Element    xpath=//a[contains(text(), 'Add to cart')]
    Sleep    2
    Handle Alert
    Sleep    1
    Click Element    xpath=//a[@class='nav-link' and contains(text(), 'Home')]    #Clicar em Home
    Sleep    3
    FOR    ${index}    IN RANGE    1
        Execute JavaScript    window.scrollBy(0, window.innerHeight * 0.15);  #Rola % da altura da janela
        Sleep    1  #Aguarda segundos para permitir o carregamento
    END
    Execute JavaScript    var style = document.createElement('style'); style.innerHTML = '.highlight { background-color: rgba(255, 255, 0, 0.0); transition: background-color 0.5s, transform 0.2s; transform: scale(1.01); }'; document.head.appendChild(style); var el = document.evaluate("//a[contains(text(),'Laptops')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; if (el) { el.classList.add('highlight'); setTimeout(() => { el.classList.remove('highlight'); }, 700); }
    Click Element    xpath=//a[contains(text(),'Laptops')]    #Clicar no menu Laptops
    FOR    ${index}    IN RANGE    1    100  # Limite de iterações para evitar loop infinito
    Execute JavaScript    window.scrollBy(0, window.innerHeight);  #Rola a altura da janela
    Sleep    1  #Aguarda segundos para permitir o carregamento
    ${previous_height}=    Execute JavaScript    return document.body.scrollHeight;  #Altura da página antes da rolagem
    ${current_height}=    Execute JavaScript    return window.innerHeight + window.scrollY;  #Posição atual de rolagem
    Run Keyword If    ${previous_height} <= ${current_height}    Exit For Loop  #Sai do loop se a rolagem alcançar o final
    END
    Sleep    2
    Wait Until Element Is Visible    xpath=//a[contains(text(), '${LAPTOPS}')]    timeout=8s
    Scroll Element Into View    xpath=//a[contains(text(), '${LAPTOPS}')]
    Click Element    xpath=//a[contains(text(), '${LAPTOPS}')]
    Sleep    2
    Scroll Element Into View    xpath=//a[contains(text(), 'Add to cart')]
    Click Element    xpath=//a[contains(text(), 'Add to cart')]
    Sleep    2
    Handle Alert
    Sleep    1
    Click Element    xpath=//a[contains(text(),'Cart')]   #Clicar em Cart
    Sleep    2

Remover Produto do Carrinho
    [Documentation]    Remove produto do carrinho de compras, atualiza a página e confirma a remoção.
    Sleep    2
    Wait Until Element Is Visible    xpath=//td[contains(text(),'${MONITORS}')]    timeout=3s
    Click Element    //td[contains(text(),'${MONITORS}')]/following-sibling::td/a[contains(text(),'Delete')]
    Sleep    2
    Reload Page
    Sleep    1
    Page Should Not Contain    ${MONITORS}
    Sleep    2
    Close Browser


