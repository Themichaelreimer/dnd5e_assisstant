class ProductsController < ApplicationController
  http_basic_authenticate_with :name => Rails.application.config.basic_auth_user, :password => Rails.application.config.basic_auth_pass if Rails.env.production?

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
    @product.price_cents = Money.new(@product.price_cents, 'CAD')
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to root_path
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :price_cents, :expires_at, photos: [])
    end
end
