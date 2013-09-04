class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
	end

	def show
		@pictures = Picture.find(params[:id])
	end

	def new
	end

	def create
		@picture = Picture.new(params.require(:picture).permit(:title, :artist, :url))
			if @picture.save 
				redirect_to pictures_url
			else
				render :new
			end
		end
		 # render :text => "Saving a picture. URL: #{params[:url]}, Title: #{params[:title]}, Artist: #{params[:artist]}"
	end
end