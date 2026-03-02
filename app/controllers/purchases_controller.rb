class PurchasesController < ApplicationController
    def index
        @query = params[:query]
        @field = params[:field]


        @purchases = Purchase.includes(:customer, line_items: :product)


        if @query.present? && @field.present?
            case @field
            when "customer_id"
                @purchases = @purchases.where("purchases.customer_id LIKE ?", "%#{@query}%")
            when "total_price"
                @purchases = @purchases.where("purchases.total_price LIKE ?", "%#{@query}%")
         
            end
        end




        @purchases = @purchases.order(:id).page(params[:page]).per(30)
        end
    
    def show
        @purchase = Purchase.find(params[:id])
    end
end
