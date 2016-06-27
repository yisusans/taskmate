class MessagesController < ApplicationController

  def create
    @conversation = Conversation.new(group_id: params[:group_id])
    @message = @conversation.messages.build(message_params)
    @message.sender = current_user

    if @message.save! && @conversation.save!
    else
      redirect_to conversations_path
    end
  end

  private
    def message_params
      params.require(:message).permit(:content, :receiver_id)
    end
end
