class UsersController < ApplicationController
  # skip_after_action :verify_authorized

  def index
    # @users = User.order(:id)
    skip_policy_scope
  end

  def impersonate
    @user = User.find(params[:id])
    authorize @user
    impersonate_user(@user)
    redirect_to root_path
  end

  def stop_impersonating
    authorize current_user
    stop_impersonating_user
    redirect_to root_path
  end
end
