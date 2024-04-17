require 'rails_helper'

describe 'User sign-up' do
  it 'Successfully' do
    # Arrange

    # Act
    visit root_path
    click_on 'Entrar'
    click_on 'Criar uma conta'
    fill_in 'Nome', with: 'Wololo'
    fill_in 'E-mail', with: 'wololo@aoe.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    # Assert
    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'wololo@aoe.com'
    expect(page).to have_content 'Sair'
    user = User.last
    expect(user.name).to eq "Wololo"
  end
end