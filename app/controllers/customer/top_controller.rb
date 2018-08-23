class Customer::TopController < ApplicationController
    def index
        render action: 'index'
        # raise Forbidden
    end
end
