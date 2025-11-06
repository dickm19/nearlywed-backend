require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome_email" do
    let(:user) { User.create(email: "test@example.com") }
    let(:mail) { UserMailer.with(user: user).welcome_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to NearlyWed!")
      expect(mail.to).to eq([ user.email ])
      expect(mail.from).to eq([ "nearlywed1@gmail.com" ])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("You have successfully signed up for NearlyWed")
      expect(mail.body.encoded).to match("Thanks for joining and have a great day!")
    end
  end
end
