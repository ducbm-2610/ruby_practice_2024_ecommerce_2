class ProductsController < ApplicationController
  def index
    @products = Product.all.newest
  end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update; end
end
