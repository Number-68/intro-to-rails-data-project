class ProductsController < ApplicationController
    def index 
        @products = Product.order(:id).page(params[:page]).per(30) 
    end
end
