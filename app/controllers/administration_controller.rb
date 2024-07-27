class AdministrationController < ActionController::Base
  layout('users')
  helper_method(:current_user)
  before_action(:identify_user)

  private

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def identify_user
    redirect_to(new_user_session_path, alert: 'Inicia sesión') unless current_user
  end
end
