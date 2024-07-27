class ProductsController < ApplicationController
  include ProductsHelper

  before_action :find_product, except: %i(index new create)

  def index
    @q = Product.ransack(params[:q])
    @pagy, @products = pagy @q.result.newest, items: Settings.digit_10
  end

  def show
    @product_category = @product.product_category
  end

  def new; end

  def edit; end

  def create; end

  def update; end

  private

  def find_product
    @product = Product.find_by id: params[:id]
    return if @product

    redirect_to root_path
    flash[:warning] = "Product not found !"
  end
end
