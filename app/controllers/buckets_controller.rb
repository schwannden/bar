class BucketsController < ApplicationController
  before_action :set_bucket, only: [:show]

  def index
      @bucket = Bucket.all
  end

  def index_grid
      @bucket = Bucket.all
  end

  def show
  end

  private
  def set_bucket
      @bucket = Bucket.find(params[:id])
  end

end
