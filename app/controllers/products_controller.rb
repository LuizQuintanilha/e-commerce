class ProductsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Salvo com sucesso'
      redirect_to root_path
    else
      flash[:alert] = 'Não foi possível salvar os dados'
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :code, :photo)
  end

  
end