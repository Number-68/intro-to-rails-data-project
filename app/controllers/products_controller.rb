class ProductsController < ApplicationController
    def index 
        @query = params[:query]
        @field = params[:field]


        @products = Product.includes(:category)

        if @query.present? && @field.present?
            case @field
            when "name"
                @products = @products.where("products.name LIKE ?", "%#{@query}%")
            when "brand"
                @products = @products.where("products.brand LIKE ?", "%#{@query}%")
            when "category"
                @products = @products.joins(:category).where("categories.product_category LIKE ?", "%#{@query}%")
            end
        end




        @products = @products.order(:id).page(params[:page]).per(30)

    end
end
