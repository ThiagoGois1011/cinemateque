require 'rails_helper'

describe 'Usuário cadastra um ator' do
  it 'sucess' do
    user = FactoryBot.create(:user, email: 'joao@email.com')

    login_as user
    visit root_path
    click_on 'Atores'
    click_on 'Adicionar Ator'
    fill_in 'Nome', with: 'Vin Diesel'
    fill_in 'Data de Nascimento', with: '1967-07-18'
    fill_in 'Nascionalidade', with: 'EUA'
    click_on 'Criar Ator'

    expect(page).to have_content('Ator cadastrado com sucesso!')
    expect(current_path).to blabla_path
  end
end