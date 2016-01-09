class BucketDecorator

  def initialize (bucket)
    @bucket = bucket
  end

  def grid_image_url
    @bucket.galleries.first.image.grid.url
  end

  def avatar
    @bucket.galleries.first
  end

  def avatar_url
    @bucket.galleries.first.image.url
  end

  def thumb_url
    @bucket.galleries.first.image.thumb.url
  end

  def to_param
    @bucket.id.to_s
  end

  def available_no_repeat
    @bucket.availables.find_by filter_type: "no repeat"
  end

  def available_daterange
    @bucket.availables.where filter_type: "daterange"
  end

  def method_missing(method_name, *args, &block)
    @bucket.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private=false)
    @bucket.respond_to?(method_name, include_private) || super
  end
end
