class Admin::ProjectsController < AdminController
	layout "admin"
	
	before_action	:find_project, only: [:show, :edit, :update, :destroy]

	def new
		@project = Project.new
	end

	def index
		@projects = Project.all
	end

	def update
		if @project.update(project_params)
			if params[:projectphotos]

				params[:projectphotos].each { |image| @project.projectphotos.create(image: image) }
			end
			redirect_to admin_projects_path
			flash[:success] = "Обновлено"
		end
	end
	
	def edit
	end

	def show
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			if params[:projectphotos]
				params[:projectphotos].each { |image| @project.projectphotos.create(image: image) }
			end
			redirect_to admin_projects_path
			flash[:success] = 'Вы успешно создали проект'
		else
			flash[:alert] = 'Что-то пошло не так'
			render 'new'
		end
	end

	def destroy
		if @project.destroy
			redirect_to admin_projects_path
			flash[:info] = 'Вы успешно удалили проект'
		end
	end

	private

	def find_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:title, :description, :desctitle, { teammember_ids: [] },
		projectphotos_attributes: [:image, :project_id, :_destroy, :id] )
	end
end
