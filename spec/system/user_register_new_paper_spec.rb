require 'rails_helper'

describe 'Usuário cadastra um novo papel' do
  it 'com sucesso' do
    user = FactoryBot.create(:user, email: 'joao@email.com')
    FactoryBot.create(:actor, name: 'Vin Diesel')
    FactoryBot.create(:movie, title: 'Velozes e Furiosos', year: 2000)

    login_as user
    visit root_path
    click_on 'Atores'
    click_on 'Vin Diesel'
    click_on 'Adicionar Papel'
    fill_in 'Nome do Personagem', with: 'Toretto'
    select 'Velozes e Furiosos', from: 'Filmes'
    click_on 'Criar Papel'

    expect(page).to have_content('Papel cadastrado com sucesso.')
    expect(page).to have_content('Nome do Personagem: Toretto')
    expect(page).to have_content('Título: Velozes e Furiosos')
  end

  it 'com campos inválidos' do
    user = FactoryBot.create(:user, email: 'joao@email.com')
    FactoryBot.create(:actor, name: 'Vin Diesel')
    FactoryBot.create(:movie, title: 'Velozes e Furiosos', year: 2000)

    login_as user
    visit root_path
    click_on 'Atores'
    click_on 'Vin Diesel'
    click_on 'Adicionar Papel'
    fill_in 'Nome do Personagem', with: ''
    select '', from: 'Filmes'
    click_on 'Criar Papel'

    expect(page).to have_content('Papel não foi adicionado.')
  end
end