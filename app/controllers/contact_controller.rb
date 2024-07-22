class ContactController < ApplicationController
  def index
    @profile = Profile.current_profile
  end
end
