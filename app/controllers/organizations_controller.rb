class OrganizationsController < ApplicationController
  before_action :set_user, only: [:index]
  def index
    @organizations = Organization.all
  end

  private
end
