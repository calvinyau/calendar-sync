# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( fullcalendar.css )
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( jquery-ui.custom.min.js )
Rails.application.config.assets.precompile += %w( moment.min.js )
Rails.application.config.assets.precompile += %w( fullcalendar.js )
Rails.application.config.assets.precompile += %w( application.css )
Rails.application.config.assets.precompile += %w( application.js )
Rails.application.config.assets.precompile += %w( mycalendar.js.jsx )
Rails.application.config.assets.precompile += %w( show_panel.js.jsx )
Rails.application.config.assets.precompile += %w( new_edit_panel.js.jsx )
