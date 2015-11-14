class Admin::GalleriesController < Admin::AdminBaseController
  before_action :set_admin_gallery, only: [:update]

  def update
    @admin_gallery.update(admin_gallery_params)
    respond_to :js
  end

  private

  def set_admin_gallery
    @admin_gallery = Gallery.find(params[:id])
  end

  def admin_gallery_params
    params.require(:admin_gallery).permit(:name, :image, :text)
  end

end

