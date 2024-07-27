class Administration::MessagesController < AdministrationController
  def index
    @messages = Message.all.order(message_status: :asc, id: :desc)
  end

  def show
    @message = Message.find(params[:id])
    @message.readed!
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    flash[:notice] = 'Mensaje eliminado correctamente'
    redirect_to(administration_messages_path)
  end
end
