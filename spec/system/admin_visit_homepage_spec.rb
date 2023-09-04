require 'rails_helper'

describe 'Administrador visita homepage' do
  it 'e vê informações da página' do
    visit root_path

    expect(current_path).to eq root_path
    expect(page).to have_content('Luhh Personalize')
    expect(page).to have_content('Produtos Personalizados')
  end
  it 'e vê formulário de login' do
    visit root_path
    within('header') do
      click_on 'Administrador'
    end

    expect(current_path).to eq '/'
    expect(page).to have_content 'Acessar Conta'
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Senha'
    expect(page).to have_content 'Lembrar Conta'
    expect(page).to have_link 'Cadastrar'
    expect(page).to have_link 'Esqueceu sua senha?'
  end
  it 'e vê formulário da cadastro' do
    visit root_path
    click_on 'Administrador'
    click_on 'Cadastrar'

    expect(page).to have_content 'Cadastrar Conta'
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Senha'
    expect(page).to have_field 'Confirmação de senha'
    expect(page).to have_button 'Criar'
  end
end
