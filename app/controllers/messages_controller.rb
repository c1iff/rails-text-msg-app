class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @contacts = Contact.all
    @contact_numbers = @contacts.map { |e| e.number}
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message was sent!"
      redirect_to messages_path
    else
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body, :contact_id, :user_id, :contact_id)
  end
end
