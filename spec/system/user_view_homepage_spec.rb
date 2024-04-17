require 'rails_helper'

describe 'User visits homepage' do
  it 'And sees app name' do
    # Arrange

    # Act
      visit (root_path)

    # Assert
      expect(page).to have_content('Cadê Buffet')
  end
end