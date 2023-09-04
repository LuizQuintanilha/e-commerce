require 'rails_helper'

describe 'Admin visit homepage' do
  it 'and view the information' do
    #Arrange

    #Act
    visit root_path

    #Assert
    expect(root_path).to eq '/'
    expect(page).to have_content('Luhh Personalize')
    expect(page).to have_content('Produtos Personalizados')
  end
  it 'and view the login area' do
    #Arrange

    #Act
    visit root_path

    #Assert
    expect(page).to have_content('Entrar')

  end
end
