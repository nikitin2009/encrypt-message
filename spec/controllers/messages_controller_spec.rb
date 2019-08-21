require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe "POST #create" do
    context "with valid attributes" do
      it "creates new message" do
        post :create, params: { message: { enc_body: "Message body", destroy_after: "first_visit" } }
        expect(Message.count).to eq(1)
      end
    end
  end

end
