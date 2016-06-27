class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.find_by(id: current_user.id)
  end

  def create
    if
      @conversation = Conversation.between(params[:sender_id],params[:receiver_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_path(@conversation)
  end

  def show
    @conversation = Conversation.find_by(id: params[:id])
    @messages = @conversation.messages
    @message = @conversation.messages.build
  end

  private
    def conversation_params
      params.require(:conversation).permit(:group_id, messages_attributes: [:content, :receiver_id])
    end
end
