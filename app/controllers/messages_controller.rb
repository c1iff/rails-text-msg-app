class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @contacts = Contact.all
    @message = Message.new
    @contact_options = @contacts.map do |e|
      [e.first_name, e.id]
    end
    respond_to do |format|
      format.html { render :new }
      format.js { render :new }
    end
  end

  def create
    @contacts = Contact.all
    params[:contact_id].each do |each|
      contact = Contact.find(each)
      @message = Message.new(message_params)
      @message.to = contact.number
      @message.contact_id = contact.id
      if @message.save
        flash[:notice] = "Your message was sent!"
      else
        flash[:alert] = "Something went wrong"
      end
    end
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit( :from, :body, :contact_id, :user_id, :contact_id)
  end
end
