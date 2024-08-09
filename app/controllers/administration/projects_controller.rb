class Administration::ProjectsController < AdministrationController
  include Sortable

  def index
    @projects = Profile.current_profile.projects.order(project_status: :desc, id: :desc)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.profile = Profile.current_profile

    if @project.save
      flash[:notice] = 'Proyecto creado correctamente'
      redirect_to(administration_projects_path)
    else
      flash[:alert] = @project.errors.full_messages.join('\n')
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:notice] = 'Proyecto actualizado correctamente'
      redirect_to(administration_projects_path)
    else
      flash[:alert] = @project.errors.full_messages.join('\n')
      render(:edit, status: :unprocessable_entity)
    end
  end

  def toggle_status
    @project = Project.find(params[:id])
    @project.enabled? ? @project.disabled! : @project.enabled!

    flash[:notice] = 'Proyecto actualizado correctamente'
    redirect_to(administration_projects_path)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    flash[:notice] = 'Proyecto eliminado correctamente'
    redirect_to(administration_projects_path)
  end

  def reorder
    reorder_items(Project)

    head(:ok)
  end

  private

  def project_params
    params.require(:project).permit(:project_image,
                                    :project_name,
                                    :project_description,
                                    :project_demo_url,
                                    :project_repository_url,
                                    technology_ids: [])
  end
end
