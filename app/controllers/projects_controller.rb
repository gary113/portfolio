class ProjectsController < ApplicationController
  def index
    @projects = Profile.current_profile.projects.enabled
  end
end
