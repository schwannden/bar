class Bucket < ActiveRecord::Base
    # Alias for acts_as_taggable_on :tags
    acts_as_taggable
    acts_as_taggable_on :tags
end
