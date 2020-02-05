class StocksController < ApplicationController
    def index
        stocks = RestClient.get('https://financialmodelingprep.com/api/v3/company/stock/list')
        render json: stocks
    end

    def search
        # byebug
        render json: RestClient.get("https://financialmodelingprep.com/api/v3/search?query=#{params['value']}") 
    end

    def profile
        # byebug
        render json: RestClient.get("https://financialmodelingprep.com/api/v3/company/profile/#{params['ticker']}")
    end


end