class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :user_name, :first_name, :last_name, :number, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :user_name, :first_name, :last_name, :number, :password, :password_confirmation, :current_password)
  end
end
