class MessagesController < ApplicationController
  def create
    @profile = Profile.current_profile
    @message = Message.new(message_params.merge(profile: @profile))

    if @message.save
      flash[:notice] = 'Mensaje enviado correctamente'
    else
      flash[:alert] = @message.errors.full_messages.join('\n')
    end

    redirect_to(contact_index_path)
  end

  private

  def message_params
    params.require(:message).permit(:message_email, :message_subject, :message_content)
  end
end
