class Admin::ProjectphotosController < AdminController

	def create
		@projectphoto = Projectphoto.new(projectphoto_params)
		@projectphoto.save
	end

	private

	def projectphoto_params
		params.require(:projectphoto).permit(:id, :image, :project_id)
	end
end
