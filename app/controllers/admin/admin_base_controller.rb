class Admin::AdminBaseController < ApplicationController
  before_action :redirect_if_not_admin

  def redirect_if_not_admin
    if not admin_signed_in?
      redirect_to root_path
    end
  end

  def admin_signed_in?
    user_signed_in?
  end

end
