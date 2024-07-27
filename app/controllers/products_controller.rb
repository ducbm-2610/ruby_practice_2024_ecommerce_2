class ProductsController < ApplicationController
  include ProductsHelper

  def index
    @q = Product.ransack(params[:q])
    @pagy, @products = pagy @q.result.newest, items: Settings.digit_10
  end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update; end
end
