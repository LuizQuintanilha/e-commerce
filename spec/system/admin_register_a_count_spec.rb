require 'rails_helper'

 describe 'Admin registra uma conta' do
  context 'com sucesso' do
    it 'quando todos os dados são preenchidos corretamente' do
      visit root_path
      click_on 'Administrador'
      click_on 'Cadastrar'
      fill_in 'Nome', with: 'Luiz'
      fill_in 'Sobrenome', with: 'Quintanilha'
      fill_in 'CPF', with: '12345678910'
      fill_in 'Email', with: 'luhhpersonalize@gmail.com'
      fill_in 'Senha', with: '11235813'
      fill_in 'Confirmação de Senha', with: '11235813'
      click_on 'Criar'

      expect(current_path).to eq '/admins/sign_up'
      expect(page).to have_content 'Bem vindo! Você se registrou com sucesso.'
      expect(page).to have_button 'Encerrar Sessão'
    end
  end

  context 'com falha' do
    it 'quando nome esta em branco' do
      visit root_path
      click_on 'Administrador'
      click_on 'Cadastrar'
      fill_in 'Nome', with: ''
      fill_in 'Sobrenome', with: 'Quintanilha'
      fill_in 'CPF', with: '12345678910'
      fill_in 'Email', with: 'luhhpersonalize@gmail.com'
      fill_in 'Senha', with: '11235813'
      fill_in 'Confirmação de Senha', with: '11235813'
      click_on 'Criar'

      expect(current_path).to eq '/admins/sign_up'
      expect(page).to have_content 'Não foi possível salvar este(a) admin:'
      expect(page).to have_content 'Nome não pode ficar em branco'
    end
    it 'quando sobrenome esta em branco' do
      visit root_path
      click_on 'Administrador'
      click_on 'Cadastrar'
      fill_in 'Nome', with: 'Luiz'
      fill_in 'Sobrenome', with: ''
      fill_in 'CPF', with: '12345678910'
      fill_in 'Email', with: 'luhhpersonalize@gmail.com'
      fill_in 'Senha', with: '11235813'
      fill_in 'Confirmação de Senha', with: '11235813'
      click_on 'Criar'

      expect(current_path).to eq '/admins/sign_up'
      expect(page).to have_content 'Não foi possível salvar este(a) admin:'
      expect(page).to have_content 'Sobrenome não pode ficar em branco'
    end
    it 'quando cpf esta em branco' do
      visit root_path
      click_on 'Administrador'
      click_on 'Cadastrar'
      fill_in 'Nome', with: 'Luiz'
      fill_in 'Sobrenome', with: 'Quintanilha'
      fill_in 'CPF', with: ''
      fill_in 'Email', with: 'luhhpersonalize@gmail.com'
      fill_in 'Senha', with: '11235813'
      fill_in 'Confirmação de Senha', with: '11235813'
      click_on 'Criar'

      expect(current_path).to eq '/admins/sign_up'
      expect(page).to have_content 'Não foi possível salvar este(a) admin:'
      expect(page).to have_content 'CPF não pode ficar em branco'
    end
    it 'quando senha esta em branco' do
      visit root_path
      click_on 'Administrador'
      click_on 'Cadastrar'
      fill_in 'Nome', with: 'Luiz'
      fill_in 'Sobrenome', with: 'Quintanilha'
      fill_in 'CPF', with: '12345678910'
      fill_in 'Email', with: 'luhhpersonalize@gmail.com'
      fill_in 'Senha', with: ''
      fill_in 'Confirmação de Senha', with: '11235813'
      click_on 'Criar'

      expect(current_path).to eq '/admins/sign_up'
      expect(page).to have_content 'Não foi possível salvar este(a) admin:'
      expect(page).to have_content 'Senha não pode ficar em branco'
    end
    it 'quando confirmação de senha esta em branco' do
      visit root_path
      click_on 'Administrador'
      click_on 'Cadastrar'
      fill_in 'Nome', with: 'Luiz'
      fill_in 'Sobrenome', with: 'Quintanilha'
      fill_in 'CPF', with: '12345678910'
      fill_in 'Email', with: 'luhhpersonalize@gmail.com'
      fill_in 'Senha', with: '112233'
      fill_in 'Confirmação de Senha', with: ''
      click_on 'Criar'

      expect(current_path).to eq '/admins/sign_up'
      expect(page).to have_content 'Não foi possível salvar este(a) admin:'
      expect(page).to have_content 'Confirmação de Senha não confere'
    end
    it 'quando é menor que 6 caracteres' do
      visit root_path
      click_on 'Administrador'
      click_on 'Cadastrar'
      fill_in 'Nome', with: 'Luiz'
      fill_in 'Sobrenome', with: 'Quintanilha'
      fill_in 'CPF', with: '12345678910'
      fill_in 'Email', with: 'luhhpersonalize@gmail.com'
      fill_in 'Senha', with: '1234'
      fill_in 'Confirmação de Senha', with: '1234'
      click_on 'Criar'

      expect(current_path).to eq '/admins/sign_up'
      expect(page).to have_content 'Não foi possível salvar este(a) admin:'
      expect(page).to have_content 'Senha muito curta'
    end
  end
end
