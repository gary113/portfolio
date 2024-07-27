class ContactController < ApplicationController
  def index
    @profile = Profile.current_profile
    @message = Message.new
  end

  def send_message
    @profile = Profile.current_profile
    @message = Message.new(message_params.merge(profile: @profile))

    if @message.save
      flash[:notice] = 'Mensaje enviado correctamente'
      redirect_to(contact_index_path)
    else
      flash[:alert] = @message.errors.full_messages.join('\n')
      render(:index, status: :unprocessable_entity)
    end
  end

  private

  def message_params
    params.require(:message).permit(:message_email, :message_subject, :message_content)
  end
end
