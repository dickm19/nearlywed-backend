# Preview all emails at http://localhost:3001/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def welcome_email
        UserMailer.with(user: User.first).welcome_email
    end
end
