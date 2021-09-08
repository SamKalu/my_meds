class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def landing_page
  end

  def dashboard
    
  end
end
