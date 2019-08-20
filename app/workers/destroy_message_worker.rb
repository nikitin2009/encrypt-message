class DestroyMessageWorker
  include Sidekiq::Worker

  def perform(id)
    Message.find(id).destroy
  end
end