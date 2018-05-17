class UrlsController < ApplicationController

	def index
		@urls = Url.all
	end

	def new
		@url = Url.new
	end

	def create
		@url = Url.new(valid_params)
		@url.short_url = SecureRandom.base64[0..8]
		if @url.save
			redirect_to urls_path
		else
			@errors = "error"
			render 'new'
		end
	end

	def show
		@url = Url.find(params[:id])
	end


	private
	def valid_params
		params.require(:url).permit(:long_url)
	end
 
end