class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :katakana_last_name, :katakana_first_name, :birth_date])
  end

end