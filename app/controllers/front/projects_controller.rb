class Front::ProjectsController < ApplicationController
  
  before_action :find_project, only: [:show]

  def index
  	@projects = Project.all
  end

  def show
  	@splittedText = @project.description.split('.')
  	if @splittedText.length > 3
  		amount = @splittedText.length/3
  	else
  		amount = 1
  	end
  	@splittedText = @splittedText.in_groups_of(amount, false)
  end

  private

  def find_project
  	@project = Project.find(params[:id])
  end
end
