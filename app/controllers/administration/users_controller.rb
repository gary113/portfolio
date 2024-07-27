class Administration::UsersController < AdministrationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'Usuario creado correctamente'
      redirect_to(administration_users_path)
    else
      flash[:alert] = @user.errors.full_messages.join('\n')
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:notice] = 'Usuario eliminado correctamente'
    redirect_to(administration_users_path)
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password, :password_confirmation)
  end
end
