Given("Eu acesso o site") do
  visit "https://www.ifood.com.br/"
end

When("Eu busco pelo {string}") do |cep|
  fill_in 'cep', with: cep 
  sleep 1
end

When("Eu clico em buscar") do
  find(:css, 'input[value="Buscar"]').click
  #outra forma de clicar no botão >> click_button 'Buscar'
  sleep 1
end

Then("Eu vejo a mensagem de erro {string}") do |msgErro|
    expect(page).to have_content(msgErro)
end

Then("Eu devo ver a cidade {string} o estado {string} e a rua {string} e o numero {string}") do |cidade, uf, rua, numero|                                               
  expect(find(:xpath, '//*[@id="box4"]/form/div[1]/input[2]').value).to have_content cidade 
  expect(find(:xpath, '//*[@id="box4"]/form/div[1]/input[1]').value).to have_content uf
  expect(find(:xpath, '//*[@id="box4"]/form/div[2]/input[1]').value).to have_content rua
  find(:css, '.field5.streetNumber').set numero 
  sleep 1
  find(:css, 'input[value="Buscar"]').click 
  sleep 1
end                                                                                                                

Given("Eu vejo a lista de restaurantes pelo link") do
  expect(page).to have_current_path('https://www.ifood.com.br/lista-restaurantes', url: true)
  sleep 1
end

Given("Eu vejo o endereco {string} no topo da pagina") do |endereco|
  expect(page).to have_content(endereco)
end

Given("Eu clico no link alterar endereco") do
  click_link('Alterar Endereço')
  sleep 1
end

When("Eu clico no link nao sabe o CEP digite seu endereço") do
  find('#buscaCepPorEndereco').click
  sleep 1
end

Then("Eu vejo os campos habilitados para edicao") do
  find(:css, '.state').select 'SP'
  find(:css, '.city').select 'ARARAQUARA'
  find(:css, '.field4_semEndereco.address').set "Av Brasil" 
  find(:css, '.field5_semEndereco.streetNumber').click
  find(:css, '.field5_semEndereco.streetNumber').set "1628"  
  find(:css, 'input[value="Buscar"]').click 
  expect(page).to have_content('Logradouro')
  sleep 2
end