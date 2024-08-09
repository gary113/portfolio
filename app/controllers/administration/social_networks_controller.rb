class Administration::SocialNetworksController < AdministrationController
  include Sortable

  def index
    @social_networks = SocialNetwork.all
  end

  def new
    @social_network = SocialNetwork.new
  end

  def create
    @social_network = SocialNetwork.new(social_network_params.merge(profile: Profile.current_profile))

    if @social_network.save
      flash[:notice] = 'Red social creada correctamente'

      redirect_to(administration_social_networks_path)
    else
      flash[:alert] = @social_network.errors.full_messages.join('\n')

      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    @social_network = SocialNetwork.find(params[:id])
  end

  def update
    @social_network = SocialNetwork.find(params[:id])

    if @social_network.update(social_network_params)
      flash[:notice] = 'Red social actualizada correctamente'

      redirect_to(administration_social_networks_path)
    else
      flash[:alert] = @social_network.errors.full_messages.join('\n')

      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @social_network = SocialNetwork.find(params[:id])

    if @social_network.destroy
      flash[:notice] = 'Red social eliminada correctamente'
    else
      flash[:alert] = @social_network.errors.full_messages.join('\n')
    end

    redirect_to(administration_social_networks_path)
  end

  def toggle_status
    @social_network = SocialNetwork.find(params[:id])
    @social_network.enabled? ? @social_network.disabled! : @social_network.enabled!

    flash[:notice] = 'Red social actualizada correctamente'
    redirect_to(administration_social_networks_path)
  end

  def reorder
    reorder_items(SocialNetwork)

    head(:ok)
  end

  private

  def social_network_params
    params.require(:social_network).permit(:social_network_name, :social_network_url, :social_network_icon)
  end
end
