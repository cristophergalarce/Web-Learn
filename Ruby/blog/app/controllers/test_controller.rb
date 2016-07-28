class TestController < ApplicationController
	before_filter :find_model

	

	private
	def find_model
		@model = Test.find(params[:id]) if params[:id]
	end
end