class Administration::UserSessionsController < AdministrationController
  layout('auth')
  skip_before_action(:identify_user)
  before_action(:already_logged_in, only: %i[new create])

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(user_name: params[:user][:user_name])

    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id

      redirect_to(administration_users_path, notice: 'Sesión iniciada')
    else
      redirect_to(new_administration_user_session_path, alert: 'Credenciales inválidas')
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to(new_administration_user_session_path)
  end

  private

  def already_logged_in
    redirect_to(administration_users_path, alert: 'Ya hay una sesión iniciada') if current_user
  end
end
