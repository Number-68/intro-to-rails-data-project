class CustomersController < ApplicationController
    def index
        @query = params[:query]
        @field = params[:field]


        @customers = Customer

        if @query.present? && @field.present?
            case @field
            when "first_name"
                @customers = @customers.where("customers.first_name LIKE ?", "%#{@query}%")
            when "last_name"
                @customers = @customers.where("customers.last_name LIKE ?", "%#{@query}%")
            when "phone_number"
                @customers = @customers.where("customers.phone_number LIKE ?", "%#{@query}%")

            when "email"
                @customers = @customers.where("customers.email LIKE ?", "%#{@query}%")

            end
        end




        @customers = @customers.order(:id).page(params[:page]).per(30)
    end


    
end
