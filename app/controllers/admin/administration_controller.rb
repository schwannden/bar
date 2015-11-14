class Admin::AdministrationController < Admin::AdminBaseController

  before_action :set_admin_bucket  , only: [:show, :edit, :update, :destroy]

  # GET /admin/manage_home
  def index
  end

 private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_bucket
    @admin_bucket = bucket.find(params[:id])
  end

 # Never trust parameters from the scary internet, only allow the white list through.
  def admin_bucket_params
    params.require(:admin_bucket).permit(:title, :description, :quantity, :price, :aasm_state)
  end

end
