class StocksController < ApplicationController
  
  def search
    if params[:stock].present?
      @stock = Stock.lookup(params[:stock])
      if @stock
        render 'users/my_portfolio'
      else
        flash[:alert] = "Ticker symbol must be valid"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "Please enter a ticker symbol"
      redirect_to my_portfolio_path
    end
  end
  
end