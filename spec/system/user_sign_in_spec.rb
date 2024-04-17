require 'rails_helper'

describe 'User logs in' do
  it 'successfully' do
    # Arrange
    User.create!(email: 'abd@de.com', password: 'password')

    # Act
    visit root_path
    click_on 'Entrar'
    within('form') do
      fill_in 'E-mail', with: 'abd@de.com'
      fill_in 'Senha', with: 'password'
      click_on 'Entrar'
    end

    # Assert
    
    within('nav') do
      expect(page).not_to have_link 'Entrar'
      expect(page).to have_button 'Sair'
      expect(page).to have_content 'abd@de.com'
    end
    expect(page).to have_content 'Login efetuado com sucesso.'
  end

  it 'And User logs out' do 
    # Arrange
    User.create!(email: 'abd@de.com', password: 'password')

    # Act
    visit root_path
    click_on 'Entrar'
    within('form') do
      fill_in 'E-mail', with: 'abd@de.com'
      fill_in 'Senha', with: 'password'
      click_on 'Entrar'
    end
    click_on 'Sair'

    # Assert
    within('nav') do
      expect(page).not_to have_button 'Sair'
      expect(page).not_to have_content 'abd@de.com'
      expect(page).to have_link 'Entrar'
    end
    expect(page).to have_content 'Logout efetuado com sucesso.'
  end
end