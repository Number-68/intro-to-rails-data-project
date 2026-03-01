class CustomersController < ApplicationController
    def index
        @customers = Customer.order(:id).page(params[:page]).per(30) 
    end


    
end
