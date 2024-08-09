class Administration::TechnologiesController < AdministrationController
  include Sortable

  def index
    @technologies = Technology.all
  end

  def new
    @technologies = Technology.new
  end

  def create
    @technology = Technology.new(technology_params)

    if @technology.save
      flash[:notice] = 'Tecnología creada correctamente'

      redirect_to(administration_technologies_path)
    else
      flash[:alert] = @technology.errors.full_messages.join('\n')

      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    @technology = Technology.find(params[:id])
  end

  def update
    @technology = Technology.find(params[:id])

    if @technology.update(technology_params)
      flash[:notice] = 'Tecnología actualizada correctamente'

      redirect_to(administration_technologies_path)
    else
      flash[:alert] = @technology.errors.full_messages.join('\n')

      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @technology = Technology.find(params[:id])

    if @technology.destroy
      flash[:notice] = 'Tecnología eliminada correctamente'
    else
      flash[:alert] = @technology.errors.full_messages.join('\n')
    end

    redirect_to(administration_technologies_path)
  end

  def toggle_status
    @technology = Technology.find(params[:id])
    @technology.enabled? ? @technology.disabled! : @technology.enabled!

    flash[:notice] = 'Tecnología actualizada correctamente'
    redirect_to(administration_technologies_path)
  end

  def reorder
    reorder_items(Technology)

    head(:ok)
  end

  private

  def technology_params
    params.require(:technology).permit(:technology_name, :social_network_icon)
  end
end
