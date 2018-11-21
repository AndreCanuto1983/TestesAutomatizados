Before do
    Capybara.page.current_window.resize_to(1280, 720)
end

Before('@cenario3,@cenario4') do
    #isto que fiz aqui não é a maneira correta de se fazer, estou buscando uma solução
    visit "https://www.ifood.com.br/"
    fill_in 'cep', with: "14801050" 
    find(:css, 'input[value="Buscar"]').click
    sleep 2
    find(:css, '.field5.streetNumber').set "1298"
    find(:css, 'input[value="Buscar"]').click 
end

After do |scenario|
    puts "Fim do teste"
    nome_cenario = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')  #elimina caracteres especiais do nome do cenario
    nome_cenario = nome_cenario.gsub(' ', '_').downcase!  # substitui espacos por _ e converte tudo em minusculas
    screenshot = "reports/screenshots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Evidencia')
end