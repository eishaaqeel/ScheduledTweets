class RegistrationsController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        # Send email
        # TERMINAL: rails g mailer Register welcome
        RegisterMailer.with(user: @user).welcome.deliver_now

        session[:user_id] = @user.id
        redirect_to root_path, notice: "Successfully created account"
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end