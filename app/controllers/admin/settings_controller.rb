class Admin::SettingsController < AdminController


	def index

	end

	def edit
		@setting = Setting.first
	end

	def update
		@setting = Setting.find(params[:id])
		if @setting.update(setting_params)
			redirect_to edit_admin_setting_path(@setting)
			flash[:success] = "Обновлено"
		else
			render action: :edit
			flash[:alert] = 'Что-то пошло не так'
		end

	end

	private

	def setting_params
		params.require(:setting).permit(:about, :phone, :phone2, :mail, :address)
	end
end
