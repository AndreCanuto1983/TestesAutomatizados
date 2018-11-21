Feature: Acessar os restaurantes e pratos da minha cidade

   Como um visitante do site do iFood
   Eu posso selecionar a minha cidade sem precisar fazer login
   Eu posso visualizar os restaurantes e pratos disponiveis

   @cenario1
   Scenario: Verificar cep inválido
      Given Eu acesso o site
      When Eu busco pelo "99999999"
      And Eu clico em buscar
      Then Eu vejo a mensagem de erro "Não reconhecemos esse CEP. Tem certeza que esse é mesmo o número?"

   @cenario2
   Scenario: Verificar cep válido
      Given Eu acesso o site
      When Eu busco pelo "14810746"
      And Eu clico em buscar
      Then Eu devo ver a cidade "ARARAQUARA" o estado "SP" e a rua "AV ANTONIO PEREIRA DA SILVA" e o numero "15"

   @cenario3
   Scenario: Verificar a lista de restaurante e o endereço no topo da página
      Given Eu vejo a lista de restaurantes pelo link
      Then Eu vejo o endereco "Alterar Endereço" no topo da pagina

   @cenario4
   Scenario: Verificar a opção de alterar endereço
      Given Eu clico no link alterar endereco
      When Eu clico no link nao sabe o CEP digite seu endereço
      Then Eu vejo os campos habilitados para edicao