class RegisterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.register_mailer.welcome.subject
  #
  def welcome
    @token = params[:user].signed_id(purpose: "welcome_user")

    mail to: params[:user].email
  end
end
