class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :load_and_authorize_resource

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :surname, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:firstname, :surname, :email, :password, :current_password)
    end
  end

  def load_and_authorize_resource
    @load_and_authorize_resource ||= ::Ability.new(current_user)
  end
end
