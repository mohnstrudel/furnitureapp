class Admin::ServicepicsController < AdminController
	
	def create
		@servicepic = Servicepic.new(servicepic_params)
		@servicepic.save
	end

	private

	def servicepic_params
		params.require(:servicepic).permit(:id, :servicepic, :service_id)
	end
end
