module EmberCLI
  module ViewHelpers
    def include_ember_script_tags(app_name)
      app = EmberCLI.configuration.apps.fetch(app_name)
      javascript_include_tag *app.exposed_js_assets
    end

    def include_ember_stylesheet_tags(app_name)
      app = EmberCLI.configuration.apps.fetch(app_name)
      stylesheet_link_tag *app.exposed_css_assets
    end

    def include_ember_alternative_stylesheet_tags(app_name, *sources)
      app = EmberCLI.configuration.apps.fetch(app_name)

      sources = sources.map do |source_or_option|
        (source_or_option.is_a? Hash) ? source_or_option : "#{app.name}/#{source_or_option}"
      end

      stylesheet_link_tag *sources
    end
  end
end
