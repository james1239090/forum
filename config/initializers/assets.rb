# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
 Rails.application.config.assets.precompile += %w( groups.css posts.css account/groups.css account/posts.css account/likes.css)
 Rails.application.config.assets.precompile += %w( groups.js posts.js account/groups.js account/posts.js account/likes.js)
