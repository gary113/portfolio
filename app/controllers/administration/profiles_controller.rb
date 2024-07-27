class Administration::ProfilesController < AdministrationController
  before_action(:set_profile, only: %i[show edit update destroy activate])

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      flash[:notice] = 'Perfil creado correctamente'
      redirect_to(administration_profiles_path)
    else
      flash[:alert] = @profile.errors.full_messages.join('\n')
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit; end

  def update
    if @profile.update(profile_params)
      flash[:notice] = 'Perfil actualizado correctamente'
      redirect_to(administration_profiles_path)
    else
      flash[:alert] = @profile.errors.full_messages.join('\n')
      render(:edit, status: :unprocessable_entity)
    end
  end

  def show; end

  def destroy
    @profile.destroy

    flash[:notice] = 'Perfil eliminado correctamente'
    redirect_to(administration_profiles_path)
  end

  def activate
    @other_profiles = Profile.where.not(id: @profile.id)

    begin
      ActiveRecord::Base.transaction do
        @profile.active!
        @other_profiles.each(&:inactive!)
      end

      flash[:notice] = 'Perfil activado correctamente'
    rescue StandardError => e
      flash[:alert] = e.message
    end

    redirect_to(administration_profiles_path)
  end

  private

  def profile_params
    params.require(:profile).permit(:profile_picture,
                                    :profile_name,
                                    :profile_email,
                                    :profile_phone,
                                    :profile_greeting,
                                    :profile_home_text,
                                    :profile_about_text)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
