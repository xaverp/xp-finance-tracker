class StocksController < ApplicationController

  def search #new_lookup is the method we created in stock.rb, params[:stock] will take the ticker symbol and the function with give us the latest price
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else 
        respond_to do |format|
          flash.now[:alert] = 'Please enter a valid symbol to search'
          format.js { render partial: 'users/result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter a symbol to search'
        format.js { render partial: 'users/result' }
      end
    end
  end

end