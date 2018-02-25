class RegistrationsController < Devise::RegistrationsController

  #リダイレクト先をユーザーページにする
  def after_sign_up_path_for(resource)
      user_path(resource)
  end

  private
  #strong paramaters
    def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
