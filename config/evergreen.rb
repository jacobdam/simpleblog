unless defined?(EVERGREEN_LOADED)
  EVERGREEN_LOADED = true

  require ::File.expand_path('../environment',  __FILE__)

  unless "".respond_to?(:each)
    String.class_eval do
      def each &block
        self.lines &block
      end
    end
  end

  module Evergreen

    class << self
      def application_with_additions(suite)
        app = application_without_additions(suite)

        app.map "/assets" do
          assets = Rails.application.config.assets
          if assets.enabled
            require 'sprockets'
            sprockets = Sprockets::Environment.new(suite.root)
            sprockets.static_root = File.join(suite.root, 'public', assets.prefix)
            sprockets.paths.concat assets.paths
            sprockets.js_compressor = nil
            run sprockets
          end
        end
        app
      end

      alias_method :application_without_additions, :application
      alias_method :application, :application_with_additions
    end
  end

end
