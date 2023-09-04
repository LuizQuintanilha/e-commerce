require 'rails_helper'

describe 'Admin registra uma conta' do
  context 'com sucesso' do
    it 'quando todos os dados são preenchidos corretamente' do
      visit root_path
      click_on 'Administrador'
      click_on 'Cadastrar'
      fill_in 'Email', with: 'luhhpersonalize@gmail.com'
      fill_in 'Senha', with: '11235813'
      fill_in 'Confirmação de senha', with: '11235813'
      click_on 'Criar'

      expect(current_path).to eq '/'
      expect(page).to have_content 'Cadastrar Conta'
      expect(page).to have_content 'Cadastrado com sucesso'
    end
  end
end