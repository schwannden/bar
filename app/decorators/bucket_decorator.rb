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

  def to_param
    @bucket.id.to_s
  end

  def method_missing(method_name, *args, &block)
    @bucket.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private=false)
    @bucket.respond_to?(method_name, include_private) || super
  end
end
