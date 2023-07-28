Jekyll::Hooks.register :site, :after_init do |site|
  bootstrap_gem_path = `bundle show bootstrap`.chomp
  bootstrap_sass_path = "#{bootstrap_gem_path}/assets/stylesheets"

  if !site.config.has_key?("sass")
    site.config["sass"] = {}
  end

  if !site.config["sass"].has_key?("load_paths")
    site.config["sass"]["load_paths"] = []
  end

  site.config["sass"]["load_paths"] << bootstrap_sass_path

  Jekyll.logger.info "Bootstrap:", "Added Bootstrap files to sass loading paths"
end
