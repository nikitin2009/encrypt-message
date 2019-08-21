require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe Message, type: :model do

  describe "validations" do
    it "is valid with all fields filled" do
      valid_message = Message.new(enc_body: "Message body", destroy_after: "one_hour")
      expect(valid_message).to be_valid
    end

    it "is not valid with empty enc_body field" do
      invalid_message = Message.new(enc_body: nil)
      expect(invalid_message).to be_invalid
    end
  end

  describe "scheduling jobs" do
    it "schedules a new DestroyMessageWorker job when destroy_after field is set as one_hour" do
      expect {
        Message.create(enc_body: "Message body", destroy_after: "one_hour")
      }.to change(DestroyMessageWorker.jobs, :size).by(1)
    end
  end

end
