class Message < ApplicationRecord
  enum destroy_after: [:first_visit, :one_hour]

  validates_presence_of :enc_body, message: "Message can't be blank"
end
