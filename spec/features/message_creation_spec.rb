require "rails_helper"

RSpec.feature "Message creation", :type => :feature do
  scenario "User creates a new message" do
    visit "/"

    fill_in "message_enc_body", with: "New message"
    fill_in "password", with: "1234"
    fill_in "password_confirmation", with: "1234"

    click_button "Create"

    expect(page).to have_text("The message was successfully created!")
  end

  scenario "A message gets destroyed after visiting" do

    # Create a new message
    visit "/"

    fill_in "message_enc_body", with: "New message"
    fill_in "password", with: "1234"
    fill_in "password_confirmation", with: "1234"
    choose "message_destroy_after_first_visit"

    click_button "Create"

    expect(page).to have_text("The message was successfully created!")

    # View the message
    expect {
        visit message_url Message.last
      }.to change(Message.all, :size).by(-1)
  end
end