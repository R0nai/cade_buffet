require 'rails_helper'

describe 'User logs in' do
  it 'successfully' do
    # Arrange
    User.create!(email: 'wololo@aeo.com', password: 'password')

    # Act
    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'wololo@aoe.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'

    # Assert
    expect(page).not_to have_link 'Entrar'
    expect(page).to have_link 'Sair'
    within('nav') do
      expect(page).to have_content 'wololo@aoe.com'
    end
  end
end