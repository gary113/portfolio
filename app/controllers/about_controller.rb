class AboutController < ApplicationController
  def index
    @profile = Profile.current_profile
  end
end
