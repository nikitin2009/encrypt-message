class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      success_msg = "The message was successfully created! (#{message_url(@message)})."

      case @message.destroy_after
      when "first_visit"
        success_msg << " It will be destroyed immediately when someone visits the link"
      when "one_hour"
        success_msg << " It will be destroyed in one hour"
      end

      flash[:success] = success_msg
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  private

    def message_params
      params.require(:message).permit(:enc_body, :destroy_after)
    end
end
