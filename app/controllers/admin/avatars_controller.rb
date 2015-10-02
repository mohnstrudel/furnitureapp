class Admin::AvatarsController < AdminController

	def create
		@avatar = Avatar.new(avatar_params)
		@avatar.save
	end

	private

	def avatar_params
		params.require(:avatar).permit(:id, :avatar, :service_id)
	end
end
