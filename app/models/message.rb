class Message < ApplicationRecord
  enum destroy_after: [:first_visit, :one_hour]

  validates_presence_of :enc_body, message: "Message can't be blank"

  after_save :schedule_destroy

  private

    def schedule_destroy
      DestroyMessageWorker.perform_in(1.minute, id)
    end
end
