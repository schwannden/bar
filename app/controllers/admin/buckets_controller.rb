class Admin::BucketsController < Admin::AdminBaseController

  before_action :set_admin_bucket, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @admin_bucket = Bucket.new
  end

  def create
    @admin_bucket = Bucket.new admin_bucket_params
    if @admin_bucket.save
      redirect_to edit_admin_bucket_path @admin_bucket
    else
      redirect_to new_admin_bucket_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

 private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_bucket
    @admin_bucket = Bucket.find(params[:id])
  end

 # Never trust parameters from the scary internet, only allow the white list through.
  def admin_bucket_params
    params.require(:admin_bucket).permit(:title, :description, :quantity, :price, :aasm_state)
  end

end
