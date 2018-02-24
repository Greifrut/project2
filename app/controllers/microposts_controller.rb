class MicropostsController < ApplicationController
	before_action :signed_in_user

	def create
		@micropost = curent_user.microposts.build(micropost_params)

		if @micropost.save
			flash[:succes] = "Micropost created!"
			redirect_to root_path
		else
			render 'static_pages/home'
		end

	end

	def destroy
	
	end


	private

		def micropost_params
			params.require(:micropost).permit(:contet)
		end


end