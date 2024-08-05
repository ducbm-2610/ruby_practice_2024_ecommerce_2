module Admin
  class BaseController < ApplicationController
    before_action :check_if_admin

    private

    def check_if_admin
      return if current_user&.admin?

      flash[:alert] = "You are not authorized to access this section."
      redirect_to root_path
    end
  end
end
