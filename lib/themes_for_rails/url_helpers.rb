# encoding: utf-8
module ThemesForRails
  module UrlHelpers

    extend ActiveSupport::Concern
    
    included do
      helper_method :current_theme_stylesheet_path, 
        :current_theme_javascript_path, 
        :current_theme_image_path
    end

    def base_theme_stylesheet_path(args)
      base_theme_asset_path('stylesheets', args)
    end

    def base_theme_javascript_path(args)
      base_theme_asset_path('javascripts', args)
    end

    def base_theme_image_path(args)
      base_theme_asset_path('images', args)
    end

    def current_theme_stylesheet_path(asset)
      base_theme_stylesheet_path(:theme => self.theme_name, :asset => "#{asset}.css")
    end

    def current_theme_javascript_path(asset)
      base_theme_javascript_path(:theme => self.theme_name, :asset => "#{asset}.js")
    end

    def current_theme_image_path(asset)
      image, extension = asset.split(".")
      base_theme_image_path(:theme => self.theme_name, :asset => "#{image}.#{extension}")
    end

    protected 

    def base_theme_asset_path(asset, args)
      theme_dir = ThemesForRails.config.themes_routes_dir
      File.join('/themes', args[:theme], asset, args[:asset])
    end

  end
end
