class Customer::TopController < ApplicationController
    def index
        render action: 'index'
        # raise ActiveRecord::RecordNotFound
    end
end
