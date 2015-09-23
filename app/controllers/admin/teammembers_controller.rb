class Admin::TeammembersController < AdminController
  layout "admin"
  
	before_action	:find_member, only: [:update, :edit]

  def index
    @teammembers = Teammember.all
  end

  def new
  	@teammember = Teammember.new
  end

  def create
  	@teammember = Teammember.new(member_params)
  
  	if @teammember.save
  		redirect_to admin_teammembers_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	@teammember.update(member_params)
  	redirect_to admin_teammembers_path
  end

  private

  def member_params
  	params.require(:teammember).permit(:name, :position, :workstart,
      avatars_attributes: [:avatar, :teammember_id])
  end

  def find_member
  	@teammember = Teammember.find(params[:id])
  end
end