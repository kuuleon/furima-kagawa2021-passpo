class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :family_name, :family_name_kana, :first_name_kana, :birthday])
  end
end
