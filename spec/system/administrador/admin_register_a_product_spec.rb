require 'rails_helper'

describe 'Apartir da tela inicial' do
  context 'administrador faz login' do
    it 'e vê tela inicial' do
      Admin.create!(first_name: 'Luiz',
                    last_name: 'Quintanilha',
                    cpf: '12345678910',
                    email: 'luqui@luhhpersonalize.com',
                    password: '123456',
                    password_confirmation: '123456')

      visit root_path
      click_on 'Administrador'
      fill_in 'Email', with: 'luqui@luhhpersonalize.com'
      fill_in 'Senha', with: '123456'
      click_on 'Iniciar Sessão'

      expect(page).to have_content 'Logado com sucesso'
      expect(page).to have_button 'Encerrar Sessão'
      expect(page).not_to have_link 'Administrador'

    end
  end
  context 'administrador registra um produto' do
    context 'com sucesso' do
      it 'quando todos os requisitos são preenchidos' do
        Admin.create!(first_name: 'Luiz',
                      last_name: 'Quintanilha',
                      cpf: '12345678910',
                      email: 'luqui@luhhpersonalize.com',
                      password: '123456',
                      password_confirmation: '123456')

        visit root_path
        click_on 'Administrador'
        fill_in 'Email', with: 'luqui@luhhpersonalize.com'
        fill_in 'Senha', with: '123456'
        click_on 'Iniciar Sessão'
        click_on 'Cadastrar Produto'
        fill_in 'Name', with: 'Caneca Naruto Uzumaki'
        fill_in 'Description', with: 'Caneca de porcelana - 375ml - Sublimada - Pode ir no micro-ondas'
        click_on 'Salvar'

        expect(current_path).to eq "/products/new"
        expect(page).to have_content 'Nome'
        expect(page).to have_content 'Descrição'
        expect(page).to have_button 'Salvar'
        
      end
    end
  end
end