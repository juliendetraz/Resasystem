class DeviseMailer < Devise::Mailer
  # overrides Devise::Mailer template_paths
  def template_paths
    # app-wide/fallback templates
    template_path = [self.class.mailer_name]
    puts "MAILER SCOPE #{@scope_name.inspect}"
    puts "MAILER RESOURCE #{@resource.inspect}"
    puts "MAILER DMAPPING #{@devise_mapping.inspect}"
    module_name = @devise_mapping.controllers[:sessions].split('/').first
    if self.class.scoped_views? && module_name != self.class.mailer_name
      # namespace-wide templates
      template_path.unshift "#{module_name}/#{self.class.mailer_name}"
      # per-devise_resource templates
      template_path.unshift "#{module_name}/#{self.class.mailer_name}/#{@devise_mapping.plural}"
    end
    template_path
  end
end
