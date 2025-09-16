class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[create update destroy]

  def index
    @products = Product.all
    render json: serialized(@products, ProductSerializer), status: 200
  end

  def show
    render json: serialized(@product, ProductSerializer), status: 200
  end

  def create
    # @product = Product.new(product_params)
    # @product.user = @user
    @product = current_user.products.build(product_params)
    if @product.save!
      render json: serialized(@product, ProductSerializer), status: 201
    else
      render json: @product.errors.full_messages
    end
  end

  def update
    if @product = Product.update(product_params)
      render json: serialized(@product, Product), status: 204
    else
      render json: @product.errors.full_messages
    end
  end

  def destroy
    @product = Product.destroy
    render json: {message:"producto eliminado"}, status: 303
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :published, :user_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
