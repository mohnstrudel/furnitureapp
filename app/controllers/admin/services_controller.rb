class Admin::ServicesController < AdminController
	layout "admin"
	
	before_action :find_service, only: [:edit, :update, :destroy]

	def index
		@services = Service.all
	end

	def new
		@service = Service.new
	end

	def create
		@service = Service.new(service_params)
		if @service.save
			if params[:servicepics]
				params[:servicepics].each { |image| @service.servicepics.create(servicepic: image) }
			end
			redirect_to admin_services_path
			flash[:success] = 'Создано'
		else
			flash[:alert] = 'Что-то пошло не так'
			render 'new'
		end
	end

	def edit
	end

	def update
		if @service.update(service_params)
			if params[:servicepics]
				params[:servicepics].each { |image| @service.servicepics.create(servicepic: image) }
			end
			redirect_to admin_services_path
			flash[:success] = "Обновлено"
		end
	end

	def destroy
		if @service.destroy
			redirect_to admin_services_path
			flash[:info] = 'Вы успешно удалили услугу'
		end
	end

	private

	def find_service
		@service = Service.find(params[:id])
	end

	def service_params
		params.require(:service).permit(:title, :description, :desctitle,
			servicepics_attributes: [:id, :servicepic, :service_id, :_destroy])
	end
end
