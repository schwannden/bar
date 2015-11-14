class Admin::AdministrationController < Admin::AdminBaseController

  before_action :set_admin_bucket  , only: [:show, :edit, :update, :destroy]
  before_action :set_admin_buckets , only: [:buckets]

  # GET /admin/manage_home
  def index
  end

  # GET /admin/manage_bucket
  def buckets
  end


 private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_bucket
    @admin_bucket = bucket.find(params[:id])
    @bucket = @admin_bucket
  end

  def set_admin_buckets
    if params[:admin_buckets].nil?
      @admin_buckets = Admin::bucketsDecorator.new bucket.all
    else
      @aasm_state  = Admin::bucketsDecorator.new params[:aasm_state]
      @admin_buckets = Admin::bucketsDecorator.new bucket.where admin_buckets_params
    end
  end

 # Never trust parameters from the scary internet, only allow the white list through.
  def admin_bucket_params
    params.require(:admin_bucket).permit(:name, :description, :price, :rating, :discount, :image, :gallery_id)
  end

  def admin_buckets_params
    params.require(:admin_buckets).permit(:aasm_state)
  end

end
