class WatchlistsController < ApplicationController
    def index
        # byebug
        watchlist = Watchlist.all.find_all{|watchlist| watchlist.user_id == params[:user_id].to_i}

        watched_stocks = []

        watchlist.each do |stock| 
            stock = RestClient.get("https://financialmodelingprep.com/api/v3/company/profile/#{stock.stock_ticker}")
            watched_stocks.push(JSON.parse(stock))
        end
        # byebug
        
        render json: watched_stocks

        # watchlist.to_json(:include => {:watchlists => {:except => [:created_at, :updated_at]}, :user => {:except => [:created_at, :updated_at]}}, :except => [:created_at, :updated_at])

    end


    def create
        # byebug

        if Watchlist.all.any?{|watchlist| watchlist.stock_ticker == params[:watchlists][:stock_ticker] && watchlist.user_id == params[:watchlists][:user_id]} == true 
            render json: {error: "You already added this stock to your watchlist!"}
        else
                watchlist = Watchlist.create(watchlist_params)
                render json: watchlist
        end
    end

    def destroy
        # byebug
        watchlist = Watchlist.find_by(user_id: params[:watchlists][:user_id], stock_ticker: params[:watchlists][:stock_ticker])
        watchlist.destroy

        watchlist = Watchlist.all.find_all{|watchlist| watchlist.user_id == params[:watchlists][:user_id].to_i}

        # byebug
        watched_stocks = []

        watchlist.each do |stock| 
            stock = RestClient.get("https://financialmodelingprep.com/api/v3/company/profile/#{stock.stock_ticker}")
            watched_stocks.push(JSON.parse(stock))
        end


        render json: watched_stocks
    end



    private

    def watchlist_params
        params.require(:watchlists).permit(:user_id, :stock_ticker)    
    end
end

