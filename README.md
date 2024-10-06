#Projeto de Automação com Robot Framework e Selenium

Este projeto contém testes automatizados para o site [Demoblaze](https://www.demoblaze.com) utilizando Robot Framework e Selenium.

## Pré-requisitos

Antes de executar os testes, certifique-se de ter os seguintes itens instalados:

- Python 3.x
- Robot Framework
- SeleniumLibrary
- WebDriver para o navegador desejado (ex: Chrome, Edge)

## Instalação

1. Clone o repositório:
    ```bash
    git clone https://github.com/vivianqa/desafioBRIVIA.git
    cd desafioBRIVIA
    ```

2. Instale as dependências:
    ```bash
    pip install robotframework robotframework-seleniumlibrary selenium
    ```

3. Certifique-se de que o ChromeDriver ou GeckoDriver esteja no seu PATH.

## Execução dos Testes

Para executar os testes, utilize os seguintes comandos:

```bash

Para testar o cenário completo do desafio, conforme pedido:
robot tests/cenariododesafio.robot

Cenários criados para execução separada, caso necessário
Para testar a criação e validação de conta:
robot tests/criarusuario.robot

Para testar a compra de produtos até a etapa do carrinho de compras:
robot tests/comprarprodutos.robot

Para remover um produto do carrinho
robot tests/removerprodutodocarrinho.robot