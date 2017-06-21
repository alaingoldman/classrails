class MicropostsController < ApplicationController
	def new
		@micropost = Micropost.new
	end

	def show
		@micropost = Micropost.find(params[:id])
	end












	def index
		if params[:search]
			@microposts = Micropost.search(params[:search])
		else
			@microposts = Micropost.all
		end
	end









	def edit
		@micropost = Micropost.find(params[:id])
	end










	# def search
	# 	x = params[:query]
	# 	@microposts = Micropost.where(["name = ?", "<%= x %>"])
	# 	redirect_to search_path(@microposts)
	# end

	def create
		@micropost = Micropost.new(permit_params)
		if @micropost.save 
			flash[:success] = "Created!"
			redirect_to micropost_path(@micropost)
		else
			flash[:danger] = @micropost.errors.full_messages.first
			render 'new'
		end
	end

	def update
		@micropost = Micropost.find(params[:id])
		if @micropost.update_attributes(permit_params)
			flash[:success] = "Updated!"
			redirect_to micropost_path(@micropost)
		else
			flash[:danger] = @micropost.errors.full_messages.first
			render 'edit'
		end
	end

	def destroy
		@micropost = Micropost.find(params[:id])
		@micropost.delete
		flash[:danger] = "Deleted!"
		redirect_to microposts_path
	end

	private 
		def permit_params
			params.require(:micropost).permit(:name, :email, :message)
		end
end