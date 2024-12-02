require 'rails_helper'

describe 'Usuário cadastra um ator' do
  it 'com sucesso' do
    user = FactoryBot.create(:user, email: 'joao@email.com')

    login_as user
    visit root_path
    click_on 'Atores'
    click_on 'Adicionar Ator'
    fill_in 'Nome', with: 'Vin Diesel'
    fill_in 'Data de Nascimento', with: '1967-07-18'
    fill_in 'Nascionalidade', with: 'EUA'
    click_on 'Criar Ator'

    expect(page).to have_content('Ator cadastrado com sucesso.')
    expect(page).to have_content('Vin Diesel')
    expect(page).to have_content('Nacionalidade: EUA', normalize_ws: true)
    expect(page).to have_content('Data de Nascimento: 18/07/1967', normalize_ws: true)
  end

  it 'com campos inválidos' do
    user = FactoryBot.create(:user, email: 'joao@email.com')

    login_as user
    visit root_path
    click_on 'Atores'
    click_on 'Adicionar Ator'
    fill_in 'Nome', with: ''
    fill_in 'Data de Nascimento', with: ''
    fill_in 'Nascionalidade', with: ''
    click_on 'Criar Ator'

    expect(page).to have_content('Ator não cadastrado.')
    expect(current_path).to eq(actors_path)
    expect(page).to have_content('Nome não pode estar em branco')
  end
end