# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( admin/administration.css )
Rails.application.config.assets.precompile += %w( admin/administration.js )
Rails.application.config.assets.precompile += %w( admin/buckets.css )
Rails.application.config.assets.precompile += %w( admin/buckets.js )
Rails.application.config.assets.precompile += %w( buckets.css )
Rails.application.config.assets.precompile += %w( buckets.js )
Rails.application.config.assets.precompile += %w( organizations.css )
Rails.application.config.assets.precompile += %w( organizations.js )
Rails.application.config.assets.precompile += %w( home.js )
Rails.application.config.assets.precompile += %w( home.css )
Rails.application.config.assets.precompile += %w( skins/default.css )
Rails.application.config.assets.precompile += %w( animate.custom.css )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( public.js )
Rails.application.config.assets.precompile += %w( scripts.js )
