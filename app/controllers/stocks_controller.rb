class StocksController < ApplicationController
	# before_filter :find_stock

	def search_stocks
		if params[:stock]
			@stock = Stock.find_by_ticker(params[:stock])
			@stock ||= Stock.new_from_lookup(params[:stock])
		end

		if @stock
			# render json: @stock
			render partial: 'lookup'
		else
			render status: :error, nothing: true
		end
	end

	private
	# def find_stock
	# 	@stock = Stock.find(params[:id]) if params[:id]
	# end
end