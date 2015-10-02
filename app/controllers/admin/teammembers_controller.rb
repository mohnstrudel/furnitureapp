class Admin::TeammembersController < AdminController
  layout "admin"
  
	before_action	:find_member, only: [:update, :edit, :destroy]

  def index
    @teammembers = Teammember.all
  end

  def new
  	@teammember = Teammember.new
  end

  def create
    @teammember = Teammember.new(member_params)
    if @teammember.save
      if params[:avatars]
        params[:avatars].each { |image| @teammember.avatars.create(avatar: image) }
      end
      redirect_to admin_teammembers_path
      flash[:success] = 'Создано'
    else
      flash[:alert] = 'Что-то пошло не так'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @teammember.update(member_params)
      if params[:avatars]
        params[:avatars].each { |image| @teammember.avatars.create(avatar: image) }
      end
      redirect_to admin_teammembers_path
      flash[:success] = "Обновлено"
    end
  end

  def destroy
    if @teammember.destroy
      redirect_to admin_teammembers_path
      flash[:info] = 'Удалено'
    end
  end

  private

  def member_params
  	params.require(:teammember).permit(:name, :position, :workstart,
      avatars_attributes: [:avatar, :teammember_id, :id, :_destroy])
  end

  def find_member
  	@teammember = Teammember.find(params[:id])
  end
end
