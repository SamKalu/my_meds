class Users::RegistrationsController < Devise::RegistrationsController
  layout "dashboard", only: :edit

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(_resource)
    profile_dashboard_path
  end
end
