class MessagesController < ApplicationController

  def create
    @message = Message.create!(message_params)
    @message.sender_id = current_user.id
    @message.save
  end

  private
    def message_params
      params.require(:message).permit(:content, :receiver_id, :sender_id, :conversation_id)
    end
end
