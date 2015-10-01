class Front::ServicesController < ApplicationController
	before_action :find_service, only: :show

	def index
		@services = Service.all
	end

	def show
		@splittedText = @service.description.split('.')
  		if @splittedText.length > 3
  			amount = @splittedText.length/3
  		else
  			amount = 1
  		end
  		@splittedText = @splittedText.in_groups_of(amount, false)
	end

	private

	def find_service
		@service = Service.find(params[:id])
	end

end
