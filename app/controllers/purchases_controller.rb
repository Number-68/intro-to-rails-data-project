class PurchasesController < ApplicationController
    def index
        @purchases = Purchase.order(:id).page(params[:page]).per(30)    
    end
    
    def show
        @purchase = Purchase.find(params[:id])
    end
end
