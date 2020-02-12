class StocksController < ApplicationController
    def index
        stocks = Stock.all
        render json: stocks.to_json(:except => [:created_at, :updated_at, :id])
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
        render json: RestClient.get("https://financialmodelingprep.com/api/v3/historical-price-full/#{params['ticker']}?serietype=line&from=2015-02-010&to=2020-02-10")
    end

    def income_statement
        render json: RestClient.get("https://financialmodelingprep.com/api/v3/financials/income-statement/#{params['ticker']}")
    end

    def balance_sheet
        render json: RestClient.get("https://financialmodelingprep.com/api/v3/financials/balance-sheet-statement/#{params['ticker']}")
    end

    def news
        render json: RestClient.get("https://newsapi.org/v2/everything?q=#{params['stock']}&apiKey=1e7b275b05bf49b98ef45e3381cff481")
    end


end
