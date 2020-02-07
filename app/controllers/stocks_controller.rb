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

    def historical_price
        render json: RestClient.get("https://financialmodelingprep.com/api/v3/historical-price-full/#{params['ticker']}?serietype=line&from=2019-03-06&to=2021-02-06")
    end

    def income_statement
        render json: RestClient.get("https://financialmodelingprep.com/api/v3/financials/income-statement/#{params['ticker']}")
    end


end