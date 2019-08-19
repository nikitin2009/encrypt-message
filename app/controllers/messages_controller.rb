class MessagesController < ApplicationController
  def create
  end

  def show
    @message = Message.find_by(id: params[:id])
  end

  def new
  end
end
