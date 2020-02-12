# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'

Stock.destroy_all

stocks = RestClient.get('https://financialmodelingprep.com/api/v3/company/stock/list')


stocks_list = JSON.parse(stocks)

stocks_array = stocks_list["symbolsList"]

# puts stocks_array

stocks_array.each do |stock|
    Stock.create(
        title: stock["name"],
        description: stock["symbol"],
        image: 'https://cdn3.iconfinder.com/data/icons/web-and-mobile-colored-icons-vol-3/128/150-512.png',
        price: stock["price"]
    )
end