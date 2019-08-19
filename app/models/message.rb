class Message < ApplicationRecord
  enum destroy_after: [:first_visit, :one_hour]

  validates :enc_body, presence: true
end
