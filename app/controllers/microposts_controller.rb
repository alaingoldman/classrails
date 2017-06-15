class MicropostsController < ApplicationController
	def new
		@micropost = Micropost.new
	end

	def show
		@micropost = Micropost.find(params[:id])
	end

	def index
		@microposts = Micropost.all
	end

	def edit
		@micropost = Micropost.find(params[:id])
	end

	def create
		@micropost = Micropost.new(permit_params)
		@micropost.save 
		redirect_to micropost_path(@micropost)
	end

	def update
		@micropost = Micropost.find(params[:id])
		@micropost.update_attributes(permit_params)
		redirect_to micropost_path(@micropost)
	end

	private 
		def permit_params
			params.require(:micropost).permit(:name, :email, :message)
		end
end