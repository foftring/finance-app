class Stock < ApplicationRecord

  def self.find_by_ticker(ticker)
    where(ticker: ticker).first
  end

  def self.new_stock_lookup(ticker)
    looked_up_stock = StockQuote::Stock.quote(ticker)
    return nil unless looked_up_stock.name

    new_stock = new(ticker:looked_up_stock.symbol,
                      name:looked_up_stock.name,
             current_price:looked_up_stock.last_trade_price_only,
         one_year_estimate:looked_up_stock.oneyr_target_price,
            percent_change: (looked_up_stock.oneyr_target_price -
looked_up_stock.last_trade_price_only) / looked_up_stock.last_trade_price_only)
    new_stock
  end


  # new_stock = new(name: looked_up_stock.name)
  # new_stock.current_price = new_stock.last_trade_price_only
  # new_stock.one_year_estimate = new_stock.oneyr_target_price
  # new_stock.percent_change = (new_stock.one_year_estimate -
  #                            new_stock.current_price) / new_stock.current_price
end
